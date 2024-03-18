﻿using System;
using Xamarin.Essentials;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace HPxamarin
{
    public partial class App : Application
    {
        public App ()
        {
            InitializeComponent();
            if (!string.IsNullOrEmpty(Preferences.Get("MyFirebaseRefreshToken", "")))
            {
                MainPage = new NavigationPage(new LoginPage());

            }
            else
            {
                MainPage = new NavigationPage(new MainPage());
            }
           
        }

        protected override void OnStart ()
        {

        }

        protected override void OnSleep ()
        {
        }

        protected override void OnResume ()
        {

        }
    }
}

