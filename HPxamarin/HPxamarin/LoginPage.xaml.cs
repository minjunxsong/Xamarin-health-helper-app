using System;
using System.Collections.Generic;
using AddressBook;
using Firebase.Auth;
using Firebase.Database;
using Firebase.Database.Query;
using Newtonsoft.Json;
using Rg.Plugins.Popup.Services;
using Xamarin.Essentials;
using Xamarin.Forms;
using static HPxamarin.AuthPage;

namespace HPxamarin
{	
	public partial class LoginPage : ContentPage
	{
        public string WebAPIKey = "AIzaSyDJvKu4ATxDADOOZ8GmCB-O288bV6KMh94";
        public LoginPage ()
		{
			InitializeComponent ();
            GetProfileInformationAndRefreshToken();
        }

        async private void GetProfileInformationAndRefreshToken()
        {
            var authProvider = new FirebaseAuthProvider(new FirebaseConfig(WebAPIKey));
            try
            {
                // This is the saved firebaseauthentication that was saved during the time of login
                var savedfirebaseauth = JsonConvert.DeserializeObject<Firebase.Auth.FirebaseAuth>(Preferences.Get("MyFirebaseRefreshToken", ""));
                // Here we are refreshing the token
                var refreshedContent = await authProvider.RefreshAuthAsync(savedfirebaseauth);
                Preferences.Set("MyFirebaseRefreshToken", JsonConvert.SerializeObject(refreshedContent));

                // Now let's grab user information from Firebase Realtime Database
                var firebase = new FirebaseClient("https://helapp-ae123-default-rtdb.firebaseio.com/");
                var userInformation = await firebase.Child("users").Child(savedfirebaseauth.User.LocalId).Child("UserInformation").OnceSingleAsync<UserInformation>();

                // Display user information
                MyUserName.Text = userInformation.Name;
                UserEmail.Text = userInformation.UserNewEmail;
                AgeLabel.Text = $"나이: {userInformation.Age}세";
                HeightLabel.Text = $"키: {userInformation.Height}cm";
                WeightLabel.Text = $"몸무게: {userInformation.Weight}kg";
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                await App.Current.MainPage.DisplayAlert("Alert", "Oh no! Token expired", "OK");
            }
        }

        void Logout_Clicked(System.Object sender, System.EventArgs e)
        {
            Preferences.Remove("MyFirebaseRefreshToken");
            App.Current.MainPage = new NavigationPage(new MainPage());
        }
       
        private async void ExerciseJournal_Clicked(object sender, EventArgs e)
        {
            await PopupNavigation.Instance.PushAsync(new CalendarPickerPopup(async (calendarPickerResult) =>
            {
                string message = calendarPickerResult.IsSuccess ? $"Received date from popup: {calendarPickerResult.SelectedDate:dd/MM/yy}" : "Calendar Picker Canceled!";

                await App.Current.MainPage.DisplayAlert("Popup result", message, "Ok");
            }));
        }
        public class UserInformation
        {
            public string Name { get; set; }
            public string UserNewEmail { get; set; }
            public int Age { get; set; }
            public double Height { get; set; }
            public double Weight { get; set; }
        }

    }
}

