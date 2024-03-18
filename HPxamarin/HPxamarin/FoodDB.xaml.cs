using System;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Xml.Linq;
using Firebase.Auth;
using Firebase.Database;
using Firebase.Database.Query;
using Newtonsoft.Json;
using Xamarin.Forms;
using Xamarin.Essentials; // Xamarin.Essentials 네임스페이스를 추가
using static Android.Content.ClipData;
using System.Collections.Generic;

namespace HPxamarin
{
    public partial class FoodDB : ContentPage
    {
        public event EventHandler<string> FoodAdded;
        private FirebaseClient firebase;
        private FirebaseAuthProvider authProvider;
        private Firebase.Auth.FirebaseAuth savedFirebaseAuth;
        private List<XElement> searchResults = new List<XElement>();

        private Entry foodEntry;
        private Picker mealTimePicker;
        private DateTime selectedDate; // 선택된 날짜를 저장할 필드


        public FoodDB(DateTime selectedDate)
        {
            this.selectedDate = selectedDate;
            // UI 초기화
            InitializeUI();
        }


        private void InitializeUI()
        {
            foodEntry = new Entry
            {
                Placeholder = "식품 이름",
                Margin = new Thickness(0, 0, 0, 10),
                HorizontalOptions = LayoutOptions.FillAndExpand,
                FontSize = 18
            };

            Button searchButton = new Button
            {
                Text = "검색",
                Margin = new Thickness(0, 0, 0, 20),
                BackgroundColor = Color.FromHex("#3498db"),
                TextColor = Color.White,
                FontSize = 20,
                HorizontalOptions = LayoutOptions.FillAndExpand
            };

            mealTimePicker = new Picker
            {
                Title = "식사 시간 선택",
                Margin = new Thickness(0, 0, 0, 10),
                HorizontalOptions = LayoutOptions.FillAndExpand
            };
            mealTimePicker.Items.Add("아침");
            mealTimePicker.Items.Add("점심");
            mealTimePicker.Items.Add("저녁");

            Label resultLabel = new Label
            {
                FontSize = 16,
                TextColor = Color.Black,
                Margin = new Thickness(0, 20, 0, 0)
            };

            Button addButton = new Button
            {
                Text = "추가",
                Margin = new Thickness(0, 0, 0, 20),
                BackgroundColor = Color.FromHex("#27ae60"),
                TextColor = Color.White,
                FontSize = 20,
                HorizontalOptions = LayoutOptions.FillAndExpand
            };

            searchButton.Clicked += async (sender, e) =>
            {
                string foodName = foodEntry.Text;
                if (!string.IsNullOrWhiteSpace(foodName))
                {
                    // Food 객체 검색
                    string nutritionInfo = await SearchFoodNutrition(foodName);
                    if (!nutritionInfo.StartsWith("Error") && !nutritionInfo.StartsWith("Exception"))
                    {
                        // 검색 결과가 정상적으로 반환된 경우
                        resultLabel.Text = nutritionInfo;
                    }
                    else
                    {
                        // 에러 메시지가 반환된 경우
                        resultLabel.Text = "음식을 찾을 수 없습니다.";
                    }
                }
                else
                {
                    resultLabel.Text = "식품 이름을 입력하세요.";
                }
            };

            addButton.Clicked += async (sender, e) =>
            {
                string foodName = foodEntry.Text;
                string mealTime = mealTimePicker.SelectedItem.ToString();

                if (!string.IsNullOrWhiteSpace(foodName) && !string.IsNullOrWhiteSpace(mealTime))
                {
                    string nutritionInfo = await SearchFoodNutrition(foodName);
                    if (!nutritionInfo.StartsWith("Error") && !nutritionInfo.StartsWith("Exception"))
                    {
                        if (!string.IsNullOrEmpty(nutritionInfo))
                        {
                            await SaveToFirebase(foodName, mealTime, nutritionInfo);
                            resultLabel.Text = "음식이 추가되었습니다.";
                        }
                        else
                        {
                            resultLabel.Text = "검색 결과가 없습니다.";
                        }
                    }
                    else
                    {
                        // 에러 메시지가 반환된 경우
                        resultLabel.Text = "음식을 찾을 수 없습니다.";
                    }
                }
                else
                {
                    resultLabel.Text = "식품 이름과 식사 시간을 선택하세요.";
                }
            };

            Content = new StackLayout
            {
                Margin = new Thickness(20),
                Children =
                {
                    new Label
                    {
                        Text = "식품 영양정보 검색",
                        FontSize = 24,
                        FontAttributes = FontAttributes.Bold,
                        TextColor = Color.FromHex("#2c3e50"),
                        Margin = new Thickness(0, 0, 0, 20),
                        HorizontalOptions = LayoutOptions.CenterAndExpand
                    },
                    foodEntry,
                    mealTimePicker,
                    searchButton,
                    resultLabel,
                    addButton
                }
            };
        }


        private async Task<string> SearchFoodNutrition(string foodName)
        {
            string baseUrl = "http://apis.data.go.kr/1471000/FoodNtrIrdntInfoService1/getFoodNtrItdntList1";
            string serviceKey = "7zv0xqCbw9GrkAJcjNhVv6JA3DVZ1IDMZVbPigBisWKMdNhBXCVyNSncr23LefD1TnR9wk9oNcqV02%2B%2BOi6dHg%3D%3D";
            int pageNo = 1;
            int numOfRows = 1;
            string type = "xml";

            string url = $"{baseUrl}?ServiceKey={serviceKey}&desc_kor={foodName}&pageNo={pageNo}&numOfRows={numOfRows}&type={type}";

            try
            {
                using (HttpClient httpClient = new HttpClient())
                {
                    HttpResponseMessage response = await httpClient.GetAsync(url);

                    if (response.IsSuccessStatusCode)
                    {
                        string result = await response.Content.ReadAsStringAsync();

                        // 응답이 XML 형식인지 확인
                        if (result.StartsWith("<?xml"))
                        {
                            // XML을 파싱하여 데이터 추출
                            XDocument doc = XDocument.Parse(result);
                            var item = doc.Descendants("item").FirstOrDefault();

                            // 추출한 데이터를 출력 문자열로 만듭니다.
                            string output = $"식품이름: {item.Element("DESC_KOR").Value}\n" +
                                            $"1회제공량 (g): {item.Element("SERVING_WT").Value}\n" +
                                            $"열량 (kcal): {item.Element("NUTR_CONT1").Value}\n" +
                                            $"탄수화물 (g): {item.Element("NUTR_CONT2").Value}\n" +
                                            $"단백질 (g): {item.Element("NUTR_CONT3").Value}\n" +
                                            $"지방 (g): {item.Element("NUTR_CONT4").Value}\n" +
                                            $"당류 (g): {item.Element("NUTR_CONT5").Value}\n" +
                                            $"나트륨 (mg): {item.Element("NUTR_CONT6").Value}\n" +
                                            $"콜레스테롤 (mg): {item.Element("NUTR_CONT7").Value}\n" +
                                            $"포화지방산 (g): {item.Element("NUTR_CONT8").Value}\n" +
                                            $"트랜스지방산 (g): {item.Element("NUTR_CONT9").Value}";

                            return output;
                        }
                        else
                        {
                            // XML 형식이 아닌 경우 처리
                            return "Error: Invalid response format";
                        }
                    }
                    else
                    {
                        return $"Error: {response.StatusCode}";
                    }
                }
            }
            catch (Exception ex)
            {
                return $"Exception: {ex.Message}";
            }
        }


        private async Task SaveToFirebase(string foodName, string mealTime, string nutritionInfo)
        {
            try
            {
                // Firebase 인스턴스 생성
                var firebase = new FirebaseClient("https://helapp-ae123-default-rtdb.firebaseio.com/");

                // Firebase 인증 프로바이더 설정
                var authProvider = new FirebaseAuthProvider(new FirebaseConfig("AIzaSyDJvKu4ATxDADOOZ8GmCB-O288bV6KMh94\n"));
                var savedFirebaseAuth = JsonConvert.DeserializeObject<Firebase.Auth.FirebaseAuth>(Preferences.Get("MyFirebaseRefreshToken", ""));
                var refreshedContent = await authProvider.RefreshAuthAsync(savedFirebaseAuth);
                string englishMealTime = TranslateMealTimeToEnglish(mealTime);

                // nutritionInfo에서 필요한 정보 추출
                string[] lines = nutritionInfo.Split('\n');
                string name = lines[0].Substring("식품이름: ".Length);
                double servingWeight = double.Parse(lines[1].Substring("1회제공량 (g): ".Length));
                double calories = double.Parse(lines[2].Substring("열량 (kcal): ".Length));
                double carbohydrates = double.Parse(lines[3].Substring("탄수화물 (g): ".Length));
                double protein = double.Parse(lines[4].Substring("단백질 (g): ".Length));
                double fat = double.Parse(lines[5].Substring("지방 (g): ".Length));
                double sugar = ParseOrDefault(lines[6].Substring("당류 (g): ".Length), 0); // "N/A"를 0으로 대체
                double sodium = ParseOrDefault(lines[7].Substring("나트륨 (mg): ".Length), 0); // "N/A"를 0으로 대체
                double cholesterol = ParseOrDefault(lines[8].Substring("콜레스테롤 (mg): ".Length), 0); // "N/A"를 0으로 대체
                double saturatedFat = ParseOrDefault(lines[9].Substring("포화지방산 (g): ".Length), 0); // "N/A"를 0으로 대체
                double transFat = ParseOrDefault(lines[10].Substring("트랜스지방산 (g): ".Length), 0); // "N/A"를 0으로 대체

                // 사용자의 정보를 사용하여 데이터베이스에 저장합니다.
                var savedFood = await firebase
                    .Child("users")
                    .Child(refreshedContent.User.LocalId)
                    .Child("dates")
                    .Child(selectedDate.ToString("yyyy-MM-dd"))
                    .Child("food")
                    .Child(englishMealTime)
                    .PostAsync(new Food
                    {
                        식품이름 = name,
                        제공량 = servingWeight,
                        열량 = calories,
                        탄수화물 = carbohydrates,
                        단백질 = protein,
                        지방 = fat,
                        당류 = sugar,
                        나트륨 = sodium,
                        콜레스테롤 = cholesterol,
                        포화지방산 = saturatedFat,
                        트랜스지방산 = transFat
                    });
            }
            catch (Exception ex)
            {
                // 에러 발생 시 처리
                await App.Current.MainPage.DisplayAlert("Error", $"Error saving to Firebase: {ex.Message}", "OK");
            }
        }

        private double ParseOrDefault(string value, double defaultValue)
        {
            return double.TryParse(value, out double result) ? result : defaultValue;
        }




        private string TranslateMealTimeToEnglish(string mealTime)
        {
            switch (mealTime)
            {
                case "아침":
                    return "breakfast";
                case "점심":
                    return "lunch";
                case "저녁":
                    return "dinner";
                default:
                    return string.Empty;
            }
        }

        public class Food
        {
            public string 식품이름 { get; set; }
            public double 제공량 { get; set; }
            public double 열량 { get; set; }
            public double 탄수화물 { get; set; }
            public double 단백질 { get; set; }
            public double 지방 { get; set; }
            public double 당류 { get; set; }
            public double 나트륨 { get; set; }
            public double 콜레스테롤 { get; set; }
            public double 포화지방산 { get; set; }
            public double 트랜스지방산 { get; set; }
        }

    }
}
