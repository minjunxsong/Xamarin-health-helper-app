using System;
using System.Collections.Generic;
using Xamarin.Forms;
using Firebase.Database;
using Firebase.Database.Query;
using static HPxamarin.FoodDB;
using Firebase.Auth;
using Newtonsoft.Json;
using Xamarin.Essentials;

namespace HPxamarin
{
    public partial class DietPage : ContentPage
    {

        private DateTime selectedDate; // 선택된 날짜를 저장할 필드


        public DietPage(DateTime selectedDate)
        {
            InitializeComponent();


            this.selectedDate = selectedDate;

            // FirebaseClient 인스턴스 생성


            // 식단 데이터를 불러와 표시
            LoadDietData();
        }

        private async void LoadDietData()
        {
            try
            {
                var firebase = new FirebaseClient("https://helapp-ae123-default-rtdb.firebaseio.com/");

                // Firebase 인증 프로바이더 설정
                var authProvider = new FirebaseAuthProvider(new FirebaseConfig("AIzaSyDJvKu4ATxDADOOZ8GmCB-O288bV6KMh94\n"));
                var savedFirebaseAuth = JsonConvert.DeserializeObject<Firebase.Auth.FirebaseAuth>(Preferences.Get("MyFirebaseRefreshToken", ""));
                var refreshedContent = await authProvider.RefreshAuthAsync(savedFirebaseAuth);
                // Firebase에서 아침, 점심, 저녁 식단 데이터를 불러옴
                var breakfast = await firebase
                    .Child("users")
                    .Child(refreshedContent.User.LocalId)
                    .Child("dates")
                    .Child(selectedDate.ToString("yyyy-MM-dd"))
                    .Child("food")
                    .Child("breakfast")
                    .OnceSingleAsync<Dictionary<string, Food>>();

                var lunch = await firebase
                    .Child("users")
                    .Child(refreshedContent.User.LocalId)
                    .Child("dates")
                    .Child(selectedDate.ToString("yyyy-MM-dd"))
                    .Child("food")
                    .Child("lunch")
                    .OnceSingleAsync<Dictionary<string, Food>>();

                var dinner = await firebase
                    .Child("users")
                    .Child(refreshedContent.User.LocalId)
                    .Child("dates")
                    .Child(selectedDate.ToString("yyyy-MM-dd"))
                    .Child("food")
                    .Child("dinner")
                    .OnceSingleAsync<Dictionary<string, Food>>();
                
                // UI에 데이터 표시
                DisplayDiet(breakfast, lunch, dinner);
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Error loading diet data: {ex.Message}", "OK");
            }
        }

        private void DisplayDiet(Dictionary<string, Food> breakfast, Dictionary<string, Food> lunch, Dictionary<string, Food> dinner)
        {
            double totalCalories = 0;
            double totalCarbohydrates = 0;
            double totalProtein = 0;
            double totalFat = 0;
            // 아침 식단 표시
            if (breakfast != null)
            {
                foreach (var food in breakfast.Values)
                {
                    AddFoodToLayout("아침", food);
                    totalCalories += food.열량;
                    totalCarbohydrates += food.탄수화물;
                    totalProtein += food.단백질;
                    totalFat += food.지방;
                }
            }

            // 점심 식단 표시
            if (lunch != null)
            {
                foreach (var food in lunch.Values)
                {
                    AddFoodToLayout("점심", food);
                    totalCalories += food.열량;
                    totalCarbohydrates += food.탄수화물;
                    totalProtein += food.단백질;
                    totalFat += food.지방;
                }
            }

            // 저녁 식단 표시
            if (dinner != null)
            {
                foreach (var food in dinner.Values)
                {
                    AddFoodToLayout("저녁", food);
                    totalCalories += food.열량;
                    totalCarbohydrates += food.탄수화물;
                    totalProtein += food.단백질;
                    totalFat += food.지방;
                }
            }

            // 총 칼로리, 탄수화물, 단백질, 지방 표시
            Label totalLabel = new Label
            {
                Text = $"총 칼로리: {totalCalories}kcal\n" +
                       $"총 탄수화물: {totalCarbohydrates}g\n" +
                       $"총 단백질: {totalProtein}g\n" +
                       $"총 지방: {totalFat}g",
                Margin = new Thickness(10),
                FontSize = 16
            };

            dietStackLayout.Children.Add(totalLabel);
        }


        private void AddFoodToLayout(string mealTime, Food food)
        {
            // 식단 정보를 표시하는 Label 생성 및 설정
            Label foodLabel = new Label
            {
                Text = $"{mealTime}: {food.식품이름}, 칼로리: {food.열량}kcal, 탄수화물: {food.탄수화물}g, 단백질: {food.단백질}g, 지방: {food.지방}g",
                Margin = new Thickness(10),
                FontSize = 16
            };

            // StackLayout에 Label 추가
            dietStackLayout.Children.Add(foodLabel);
        }
    }
}