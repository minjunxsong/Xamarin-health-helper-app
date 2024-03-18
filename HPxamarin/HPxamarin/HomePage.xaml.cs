using System;
using HPxamarin.Model;
using Rg.Plugins.Popup.Services;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace HPxamarin
{
    public partial class HomePage : ContentPage
    {
        public HomePage()
        {
            InitializeComponent();
        }

        private async void OnLogoutButtonClicked(object sender, EventArgs e)
        {
            Preferences.Remove("MyFirebaseRefreshToken");
            await Navigation.PushAsync(new MainPage());
        }

        private async void OnMyButtonClicked(object sender, EventArgs e)
        {
            Preferences.Remove("MyFirebaseRefreshToken");
            await Navigation.PushAsync(new ProfilePage());
        }

        private async void OnMapButtonClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MapPage());
        }
       
        private async void OnFoodDBButtonClicked(object sender, EventArgs e)
        {
            await PopupNavigation.Instance.PushAsync(new CalendarPickerPopup(async (calendarPickerResult) =>
            {
                string message = calendarPickerResult.IsSuccess ? $"Received date from popup: {calendarPickerResult.SelectedDate:dd/MM/yy}" : "Calendar Picker Canceled!";

                await App.Current.MainPage.DisplayAlert("Popup result", message, "Ok");
            }));
        }
    }
}
