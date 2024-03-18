using System;
using System.Collections.Generic;
using System.Linq;
using CustomCalendarControl.Views;
using Firebase.Database;
using System.Threading.Tasks;
using Microcharts;
using Microcharts.Forms;
using Rg.Plugins.Popup.Services;
using SkiaSharp;
using Xamarin.Forms;
using Firebase.Database.Query;
using XamForms.Controls;
using System.Globalization;
using Xamarin.Essentials;
using Firebase.Auth;
using Newtonsoft.Json;

namespace HPxamarin
{
    public partial class Home : ContentPage
    {
        FirebaseClient firebaseClient = new FirebaseClient("https://helapp-ae123-default-rtdb.firebaseio.com/");
        List<ChartEntry> chartEntries = new List<ChartEntry>();
        public string currentUserID; // 현재 로그인한 사용자의 고유 식별자

        public Home()
        {
            InitializeComponent();
            LoadWeightDataFromFirebase();

            // 새로운 캘린더에 대한 이벤트 핸들러 연결
            exerciseCalendar.DateClicked += OnDateClicked;

            // 새로운 Picker에 대한 이벤트 핸들러 연결
            monthPicker.SelectedIndexChanged += OnMonthSelected;

            // 초기에는 전체 무게 차트를 표시
            UpdateChart();

            // 현재 로그인한 사용자의 고유 식별자 가져오기
            GetCurrentUserID();
        }

        private void GetCurrentUserID()
        {
            // Firebase Authentication을 통해 현재 로그인한 사용자의 정보 가져오기
            var authProvider = new FirebaseAuthProvider(new FirebaseConfig("AIzaSyDJvKu4ATxDADOOZ8GmCB-O288bV6KMh94"));
            var savedFirebaseAuth = JsonConvert.DeserializeObject<FirebaseAuth>(Preferences.Get("MyFirebaseRefreshToken", ""));

            // 현재 로그인한 사용자의 고유 식별자를 가져옴
            currentUserID = savedFirebaseAuth.User.LocalId;
        }

        // 캘린더에서 날짜를 클릭했을 때 호출되는 이벤트 핸들러
        private void OnDateClicked(object sender, DateTimeEventArgs e)
        {
            // 선택된 날짜를 가져와서 원하는 동작 수행
            DateTime selectedDate = e.DateTime;

            // 사용자에게 무게 입력 요청
            PromptForWeightInput(selectedDate);
            FilterChartDataByMonth(selectedDate);
        }
        private void OnMonthSelected(object sender, EventArgs e)
        {
            // Picker에서 선택한 월에 해당하는 무게 차트를 표시
            var selectedMonthIndex = monthPicker.SelectedIndex;
            if (selectedMonthIndex >= 0 && selectedMonthIndex < monthPicker.Items.Count)
            {
                var selectedMonth = DateTime.ParseExact(monthPicker.Items[selectedMonthIndex], "MMMM", CultureInfo.CurrentCulture);

                // 선택된 월에 해당하는 무게 차트를 표시
                FilterChartDataByMonth(selectedMonth);
            }
        }

        // 날짜를 선택하고 무게를 입력하는 메서드
        private async void PromptForWeightInput(DateTime selectedDate)
        {
            // 사용자에게 무게 입력 요청
            var weight = await DisplayPromptAsync("무게 입력", $"{selectedDate.ToShortDateString()}의 무게를 입력하세요", maxLength: 5, keyboard: Keyboard.Numeric);

            if (weight != null && double.TryParse(weight, out double parsedWeight))
            {
                // Firebase 실시간 데이터베이스에 무게만 저장
                await SaveWeightToFirebase(selectedDate, parsedWeight);

                // 새로운 차트 엔트리 추가
                AddChartEntry(selectedDate, parsedWeight);

                // 차트를 날짜순으로 정렬하여 업데이트
                UpdateChart();
            }
            else
            {
                // 잘못된 입력에 대한 처리
                await DisplayAlert("오류", "유효하지 않은 무게가 입력되었습니다", "확인");
            }
        }

        private async Task SaveWeightToFirebase(DateTime selectedDate, double weight)
        {
            try
            {
                // Firebase 데이터베이스에 "weights" 노드가 있다고 가정합니다.
                var result = await firebaseClient.Child("Workoutdata").PostAsync(new { Date = selectedDate.ToString("yyyy-MM-ddTHH:mm:ss"), Weight = weight });

                if (result.Key != null)
                {
                    await DisplayAlert("성공", $"{selectedDate.ToShortDateString()}의 무게 {weight}가 성공적으로 저장되었습니다!", "확인");
                }
                else
                {
                    await DisplayAlert("오류", "데이터베이스에 무게를 저장하는데 실패했습니다", "확인");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("오류", $"오류가 발생했습니다: {ex.Message}", "확인");
            }
        }
        private void OnMonthChanged(object sender, DateTimeEventArgs e)
        {
            // 선택된 월에 해당하는 무게 차트를 표시
            FilterChartDataByMonth(e.DateTime);
        }

        // 월에 따라 무게 데이터를 필터링하고 차트 업데이트
        private void FilterChartDataByMonth(DateTime selectedMonth)
        {
            // 선택된 월에 해당하는 무게 데이터만 필터링
            var weightsInSelectedMonth = chartEntries
                .Where(entry => DateTime.Parse(entry.Label).Month == selectedMonth.Month)
                .ToList();

            // 차트 업데이트
            chartView.Chart = new LineChart
            {
                Entries = weightsInSelectedMonth,
                LineMode = LineMode.Straight,
                LineSize = 8,
                PointMode = PointMode.Square,
                PointSize = 20,
                LabelOrientation = Orientation.Horizontal,
                LabelColor = SKColor.Parse("#0000FF"),
                LabelTextSize = 35,
                BackgroundColor = SKColor.Empty,
                IsAnimated = true,
                ValueLabelOrientation = Orientation.Horizontal
            };
        }


        private async void LoadWeightDataFromFirebase()
        {
            try
            {
                var weights = await firebaseClient.Child("Workoutdata").OnceAsync<WeightData>();

                // 모든 월에 대한 초기 무게 차트 데이터
                foreach (var weight in weights)
                {
                    var date = DateTime.Parse(weight.Object.Date);
                    var weightValue = weight.Object.Weight;

                    // 날짜를 월과 일만 표시하도록 형식 변경
                    var formattedDate = date.ToString("MM-dd");

                    // Add ChartEntry with modified Label
                    chartEntries.Add(new ChartEntry((float)weightValue)
                    {
                        Label = formattedDate,
                        ValueLabel = $"{weightValue} kg", // 단위 추가
                        Color = SKColor.Parse("#0000FF")
                    });
                }
                foreach (var group in chartEntries.GroupBy(entry => DateTime.Parse(entry.Label).ToString("MMMM")))
                {
                    monthPicker.Items.Add(group.Key);
                }

                // 초기에는 전체 무게 차트를 표시
                UpdateChart();
            }
            catch (Exception ex)
            {
                await DisplayAlert("오류", $"오류가 발생했습니다: {ex.Message}", "확인");
            }
        }
        private void AddChartEntry(DateTime date, double weight)
        {
            // 날짜를 월과 일만 표시하도록 형식 변경
            var formattedDate = date.ToString("MM-dd");

            // 새로운 차트 엔트리 추가
            var newEntry = new ChartEntry((float)weight)
            {
                Label = formattedDate,
                ValueLabel = weight.ToString(),
                Color = SKColor.Parse("#0000FF")
            };

            chartEntries.Add(newEntry);
        }
        private void UpdateChart()
        {
            // 차트 엔트리를 날짜순으로 정렬
            var sortedChartEntries = chartEntries
                .OrderBy(entry => DateTime.Parse(entry.Label))
                .ToList();

            // 차트 업데이트
            chartView.Chart = new LineChart
            {
                Entries = sortedChartEntries,
                LineMode = LineMode.Straight,
                LineSize = 8,
                PointMode = PointMode.Square,
                PointSize = 20,
                LabelOrientation = Orientation.Horizontal,
                LabelColor = SKColor.Parse("#0000FF"),
                LabelTextSize = 35,
                BackgroundColor = SKColor.Empty,
                IsAnimated = true,
                ValueLabelOrientation = Orientation.Horizontal
            };
        }


        public class WeightData
        {
            public string Date { get; set; }
            public double Weight { get; set; }
            public double count { get; set; }
        }
    }
}
