using System;
using Xamarin.Forms;
using Firebase.Auth;
using Newtonsoft.Json;
using Xamarin.Essentials;

namespace HPxamarin
{
    public partial class LogPage : ContentPage
    {
        public LogPage()
        {
            InitializeComponent();
        }

        private async void OnLoginButtonClicked(object sender, EventArgs e)
        {
            string email = EmailEntry.Text;
            string password = PasswordEntry.Text;

            if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
            {
                await DisplayAlert("알림", "이메일과 비밀번호를 모두 입력하세요.", "확인");
                return;
            }

            try
            {
                // Firebase authentication
                var authProvider = new FirebaseAuthProvider(new FirebaseConfig("AIzaSyDJvKu4ATxDADOOZ8GmCB-O288bV6KMh94"));
                var auth = await authProvider.SignInWithEmailAndPasswordAsync(email, password);

                // Get and save the refresh token
                var content = await auth.GetFreshAuthAsync();
                var serializedContent = JsonConvert.SerializeObject(content);
                Preferences.Set("MyFirebaseRefreshToken", serializedContent);

                await Navigation.PushAsync(new LoginPage());
            }
            catch (Exception)
            {
                await App.Current.MainPage.DisplayAlert("Alert", "Invalid email or password", "OK");
            }
        }
    }
}