using System;
using HPxamarin;
using Xamarin.Forms;

namespace HPxamarin
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private void OnLogPageButtonClicked(object sender, EventArgs e)
        {
            // 페이지 이동 또는 필요한 작업 수행
            Navigation.PushAsync(new LogPage()); // AuthPage는 실제 사용하려는 페이지로 변경
        }

        private void OnOnePageButtonClicked(object sender, EventArgs e)
        {
            // 페이지 이동 또는 필요한 작업 수행
            Navigation.PushAsync(new OnePage()); // AuthPage는 실제 사용하려는 페이지로 변경
        }
        private async void OnHomeButtonClicked(object sender, EventArgs e)
        {
            // 운동모니터링 페이지로 이동
            await Navigation.PushAsync(new Home());
        }

        private async void OnFoodDBButtonClicked(object sender, EventArgs e)
        {
            // 식단관리 페이지로 이동
            await Navigation.PushAsync(new FoodPage());
        }
    
      
    }
}
