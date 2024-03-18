
using System;
using Xamarin.Forms;
using Firebase.Database;
using Firebase.Database.Query;
using Firebase.Auth;
using Newtonsoft.Json;
using Xamarin.Essentials;
using Xamarin.CommunityToolkit.UI.Views;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace HPxamarin
{
    public partial class FoodPage : ContentPage
    {
        private string selectedMealType; // 선택된 식사 종류를 저장할 변수
        private FirebaseClient firebase;
        private string nutrition;
        private FirebaseAuthProvider authProvider;
        private Firebase.Auth.FirebaseAuth savedFirebaseAuth;
        public FoodPage()
        {
            InitializeComponent();
            firebase = new FirebaseClient("https://helapp-ae123-default-rtdb.firebaseio.com/");
            authProvider = new FirebaseAuthProvider(new FirebaseConfig("AIzaSyDJvKu4ATxDADOOZ8GmCB-O288bV6KMh94"));
            savedFirebaseAuth = JsonConvert.DeserializeObject<Firebase.Auth.FirebaseAuth>(Preferences.Get("MyFirebaseRefreshToken", ""));
            // 사용자의 식단 데이터를 Preferences에서 불러와서 화면에 표시
            string breakfast = Preferences.Get("Breakfast", string.Empty);
            string lunch = Preferences.Get("Lunch", string.Empty);
            string dinner = Preferences.Get("Dinner", string.Empty);
            // 사용자가 로그인되어 있으면 해당 사용자의 식단을 불러옴
            if (savedFirebaseAuth != null)
            {
                LoadUserMealData();
            }

        }
        private async void LoadUserMealData()
        {
            try
            {
                var refreshedContent = await authProvider.RefreshAuthAsync(savedFirebaseAuth);
                string currentDate = DateTime.Now.ToString("yyyy-MM-dd");

                // 해당 날짜의 식사 데이터 가져오기
                var foodData = await firebase
                    .Child("users")
                    .Child(refreshedContent.User.LocalId)
                    .Child("dates")
                    .Child(currentDate)
                    .Child("food")
                    .OnceSingleAsync<string>();

                if (!string.IsNullOrEmpty(foodData))
                {
                    // 가져온 데이터를 화면에 표시
                    AddExpanderToLayout(GetLayoutByMealType("Breakfast"), "Breakfast", foodData);
                    AddExpanderToLayout(GetLayoutByMealType("Lunch"), "Lunch", foodData);
                    AddExpanderToLayout(GetLayoutByMealType("Dinner"), "Dinner", foodData);
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("오류 발생", $"데이터를 불러오는 중 오류가 발생했습니다: {ex.Message}", "확인");
            }
        }

        private StackLayout GetLayoutByMealType(string mealType)
        {
            switch (mealType)
            {
                case "Breakfast":
                    return BreakfastNutritionLayout;
                case "Lunch":
                    return LunchNutritionLayout;
                case "Dinner":
                    return DinnerNutritionLayout;
                default:
                    return null;
            }
        }
        // Expander를 생성하여 Layout에 추가하는 메서드
        private void AddExpanderToLayout(StackLayout layout, string mealType, string nutritionData)
        {
            // 영양성분 정보를 담은 StackLayout 생성
            StackLayout nutritionLayout = CreateNutritionLabel(nutritionData);

            // Expander 생성
            Expander expander = new Expander
            {
                Header = new Label
                {
                    Text = $"{mealType} 영양성분",
                    FontAttributes = FontAttributes.Bold,
                    FontSize = Device.GetNamedSize(NamedSize.Medium, typeof(Label))
                },
                Margin = new Thickness(0, 5),
                Padding = new Thickness(10),
                Content = nutritionLayout
            };

            // Layout에 Expander 추가
            layout.Children.Add(expander);
        }

        private async void SaveButton_Clicked(object sender, EventArgs e)
        {
            // 사용자 정보를 가져오기
            var authProvider = new FirebaseAuthProvider(new FirebaseConfig("AIzaSyDJvKu4ATxDADOOZ8GmCB-O288bV6KMh94"));
            var savedfirebaseauth = JsonConvert.DeserializeObject<Firebase.Auth.FirebaseAuth>(Preferences.Get("MyFirebaseRefreshToken", ""));
            var refreshedContent = await authProvider.RefreshAuthAsync(savedfirebaseauth);

            // 현재 날짜 구하기
            string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
            try
            {
                // 아침 식사 정보 가져오기
                string breakfast = GetNutritionTextFromLayout(BreakfastNutritionLayout);

                // 점심 식사 정보 가져오기
                string lunch = GetNutritionTextFromLayout(LunchNutritionLayout);

                // 저녁 식사 정보 가져오기
                string dinner = GetNutritionTextFromLayout(DinnerNutritionLayout);

                // 확인용 메시지 구성
                string message = $"아침: {breakfast}\n점심: {lunch}\n저녁: {dinner}";

                // 메시지 창을 통해 데이터 보여주기
                await DisplayAlert("저장할 데이터 확인", message, "확인");

                // 현재 날짜의 노드에 식단 정보 저장
                await firebase.Child("users").Child(refreshedContent.User.LocalId).Child("dates").Child(currentDate).Child("food").PutAsync(new Food
                {
                    Breakfast = breakfast,
                    Lunch = lunch,
                    Dinner = dinner
                });
                Preferences.Set("Breakfast", breakfast);
                Preferences.Set("Lunch", lunch);
                Preferences.Set("Dinner", dinner);

                await DisplayAlert("Success", "식단 정보가 성공적으로 저장되었습니다.", "OK");
            }
            catch (Exception ex)
            {
                await DisplayAlert("오류 발생", $"데이터를 가져오는 중 오류가 발생했습니다: {ex.Message}", "확인");
            }
        }
        private string GetNutritionTextFromLayout(StackLayout layout)
        {
            string nutritionText = string.Empty;

            foreach (var child in layout.Children)
            {
                if (child is Expander expander && expander.Content is StackLayout nutritionLayout)
                {
                    // Expander의 Content인 StackLayout에서 영양성분 텍스트를 추출하여 저장
                    nutritionText = GetNutritionText(nutritionLayout);
                    break;
                }
            }

            return nutritionText;
        }



        private async void FoodDB_FoodAdded(object sender, string foodData)
        {
            try
            {
                // 영양성분 정보를 담은 StackLayout 생성
                StackLayout nutritionLayout = CreateNutritionLabel(foodData);

                // Expander 생성
                Expander expander = new Expander
                {
                    Header = new Label
                    {
                        Text = "영양성분",
                        FontAttributes = FontAttributes.Bold,
                        FontSize = Device.GetNamedSize(NamedSize.Medium, typeof(Label))
                    },
                    Margin = new Thickness(0, 5),
                    Padding = new Thickness(10),
                    Content = nutritionLayout
                };

                // 선택된 식사 종류에 따라 해당 Entry에 Expander 추가
                switch (selectedMealType)
                {
                    case "Breakfast":
                        BreakfastNutritionLayout.Children.Add(expander);
                        break;
                    case "Lunch":
                        LunchNutritionLayout.Children.Add(expander);
                        break;
                    case "Dinner":
                        DinnerNutritionLayout.Children.Add(expander);
                        break;
                }

                // 선택된 식사 종류에 따라 해당 식사 정보 저장
                await SaveNutritionData(selectedMealType, GetNutritionText(nutritionLayout));
            }
            catch (Exception ex)
            {
                await DisplayAlert("오류 발생", $"식단 정보를 처리하는 중 오류가 발생했습니다: {ex.Message}", "확인");
            }
        }


        private Expander CreateExpander(string headerText, string nutritionData)
        {
            // 영양성분 정보를 담은 StackLayout 생성
            StackLayout nutritionLayout = CreateNutritionLabel(nutritionData.Replace("1", "").Replace("|", "\n"));

            // Expander 생성
            return new Expander
            {
                Header = new Label
                {
                    Text = headerText,
                    FontAttributes = FontAttributes.Bold,
                    FontSize = Device.GetNamedSize(NamedSize.Medium, typeof(Label))
                },
                Margin = new Thickness(0, 5),
                Padding = new Thickness(10),
                Content = nutritionLayout
            };
        }

        private async Task SaveNutritionData(string mealType, string nutritionData)
        {
            var authProvider = new FirebaseAuthProvider(new FirebaseConfig("AIzaSyDJvKu4ATxDADOOZ8GmCB-O288bV6KMh94\n"));
            var savedFirebaseAuth = JsonConvert.DeserializeObject<Firebase.Auth.FirebaseAuth>(Preferences.Get("MyFirebaseRefreshToken", ""));
            var refreshedContent = await authProvider.RefreshAuthAsync(savedFirebaseAuth);

            string currentDate = DateTime.Now.ToString("yyyy-MM-dd");

            try
            {
                var dateNode = firebase.Child("users").Child(refreshedContent.User.LocalId).Child("dates").Child(currentDate);
                var foodNode = dateNode.Child("food");

                // 영양 데이터를 JSON 형식으로 변환
                var nutritionJson = JsonConvert.SerializeObject(nutritionData);

                // 각 식사별 노드 생성 및 데이터 추가
                switch (mealType)
                {
                    case "Breakfast":
                        await foodNode.Child("Breakfast").PutAsync(nutritionJson);
                        break;
                    case "Lunch":
                        await foodNode.Child("Lunch").PutAsync(nutritionJson);
                        break;
                    case "Dinner":
                        await foodNode.Child("Dinner").PutAsync(nutritionJson);
                        break;
                }

                await DisplayAlert("Success", $"{mealType} 식단 정보가 성공적으로 저장되었습니다.", "OK");
            }
            catch (Exception ex)
            {
                await DisplayAlert("오류 발생", $"데이터를 저장하는 중 오류가 발생했습니다: {ex.Message}", "확인");
            }
        }



        private StackLayout CreateNutritionLabel(string nutritionData)
        {
            // 영양 성분 데이터를 파싱하여 필요한 정보 추출
            string[] nutritionValues = nutritionData.Split('\n');

            // StackLayout을 생성하여 라벨들을 추가할 준비
            StackLayout stackLayout = new StackLayout();

            // 각 영양 성분에 대한 정보를 반복하여 라벨로 만들어 StackLayout에 추가
            foreach (string value in nutritionValues)
            {
                // 각 영양 성분 데이터에서 필요한 정보 추출
                string[] parts = value.Split(':');
                string nutrientName = parts[0].Trim();
                string nutrientValue = parts[1].Trim();

                // 추출된 정보를 기반으로 라벨 생성
                Label label = new Label
                {
                    Text = $"{nutrientName}: {nutrientValue}",
                    FontSize = 16,
                    TextColor = Color.Black
                };

                // 라벨을 StackLayout에 추가
                stackLayout.Children.Add(label);
            }

            // 완성된 StackLayout 반환
            return stackLayout;
        }

        // StackLayout에 있는 영양성분 텍스트를 반환하는 메서드
        private string GetNutritionText(StackLayout layout)
        {
            string nutritionText = string.Empty;

            foreach (var child in layout.Children)
            {
                if (child is Label label)
                {
                    // 라벨의 텍스트를 이어붙임
                    nutritionText += label.Text + "\n";
                }
            }

            return nutritionText;
        }

        // "식단 추가" 버튼 클릭 시 실행되는 메서드
        private async void AddMealButton_Clicked(object sender, EventArgs e)
        {
            // "식단 추가" 버튼이 클릭되었을 때 실행될 로직
            Button button = sender as Button;
            selectedMealType = button.CommandParameter.ToString(); // 선택된 식사 종류 저장

            // 팝업으로 음식 데이터베이스 검색 페이지 표시하고 식사 종류를 전달
            //FoodDB foodDBPage = new FoodDB();

            // FoodAdded 이벤트에 이벤트 핸들러 추가
            //foodDBPage.FoodAdded += FoodDB_FoodAdded;

           // await Navigation.PushModalAsync(new NavigationPage(foodDBPage));
        }

        public class Food
        {
            public string Breakfast { get; set; }
            public string Lunch { get; set; }
            public string Dinner { get; set; }
        }
    }
}
