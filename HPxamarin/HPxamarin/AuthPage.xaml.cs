using System;
using System.Threading.Tasks;
using Firebase.Auth;
using Firebase.Database;
using Firebase.Database.Query;
using Newtonsoft.Json;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace HPxamarin
{
    public partial class AuthPage : ContentPage
    {
        private const string WebAPIKey = "AIzaSyDJvKu4ATxDADOOZ8GmCB-O288bV6KMh94";

        public AuthPage()
        {
            InitializeComponent();
        }

        async void OnSignUpButtonClicked(object sender, EventArgs e)
        {
            try
            {
                // Firebase authentication
                var authProvider = new FirebaseAuthProvider(new FirebaseConfig(WebAPIKey));
                var auth = await authProvider.CreateUserWithEmailAndPasswordAsync(UserNewEmail.Text, UserNewPassword.Text);

                if (auth.User != null)
                {
                    // SignUp success
                    await App.Current.MainPage.DisplayAlert("Success", "회원가입 성공!", "OK");

                    // Save additional information to Firebase Realtime Database
                    var firebase = new FirebaseClient("https://helapp-ae123-default-rtdb.firebaseio.com/");

                    // Get current date
                    DateTime currentDate = DateTime.Now;
                    string dateString = currentDate.ToString("yyyy-MM-dd");

                    // Create a node for the current date
                    var currentDateNode = firebase.Child("users").Child(auth.User.LocalId).Child("dates").Child(dateString);

                    await firebase.Child("users").Child(auth.User.LocalId).Child("userInformation").PutAsync(new UserInformation
                    {
                        Name = NameEntry.Text,
                        Gender = GenderPicker.SelectedItem.ToString(),
                        Age = Convert.ToInt32(AgeEntry.Text),
                        Height = Convert.ToDouble(HeightEntry.Text),
                        Weight = Convert.ToDouble(WeightEntry.Text)
                    });


                    // Save initial exercise data
                    var initialExerciseData = new ExerciseData
                    {
                        BenchPress = new ExerciseEntry { Reps = 0, Weight = 0 },
                        Deadlift = new ExerciseEntry { Reps = 0, Weight = 0 },
                        Squat = new ExerciseEntry { Reps = 0, Weight = 0 }
                    };
                    await currentDateNode.Child("exerciseData").PutAsync(initialExerciseData);

                    // Save initial diet data
                    var initialDietData = new DietData
                    {
                        // Add diet data properties as needed
                    };
                    await currentDateNode.Child("dietData").PutAsync(initialDietData);
                }
            }
            catch (Exception ex)
            {
                await App.Current.MainPage.DisplayAlert("Alert", ex.Message, "OK");
            }
        }


        async void OnLoginButtonClicked(object sender, EventArgs e)
        {
            try
            {
                // Firebase authentication
                var authProvider = new FirebaseAuthProvider(new FirebaseConfig(WebAPIKey));
                var auth = await authProvider.SignInWithEmailAndPasswordAsync(UserLoginEmail.Text, UserLoginPassword.Text);

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

        public class UserInformation
        {
            public string Name { get; set; }
            public string Gender { get; set; }
            public int Age { get; set; }
            public double Height { get; set; }
            public double Weight { get; set; }
        }
        public class ExerciseEntry
        {
            public int Reps { get; set; }
            public double Weight { get; set; }
        }

        public class ExerciseData
        {
            public ExerciseEntry BenchPress { get; set; }
            public ExerciseEntry Deadlift { get; set; }
            public ExerciseEntry Squat { get; set; }
        }

        public class DietData
        {
            // Add diet data properties as needed
        }

    }
}
