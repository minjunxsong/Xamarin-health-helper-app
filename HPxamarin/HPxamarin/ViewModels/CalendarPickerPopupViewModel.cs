using Rg.Plugins.Popup.Services; // Rg.Plugins.Popup 패키지에서 Popup 서비스를 사용하기 위한 using 문
using HPxamarin.Model; // 사용자 정의 모델 클래스를 사용하기 위한 using 문
using System; // 시스템 네임스페이스를 사용하기 위한 using 문
using System.Windows.Input; // ICommand 인터페이스를 사용하기 위한 using 문
using Xamarin.Forms; // Xamarin.Forms 네임스페이스를 사용하기 위한 using 문
using Xamarin.Plugin.Calendar.Enums; // Xamarin.Plugin.Calendar.Enums 네임스페이스를 사용하기 위한 using 문

namespace HPxamarin.ViewModels
{
    // 달력 선택 팝업 뷰모델 클래스 정의
    public class CalendarPickerPopupViewModel : BasePageViewModel
    {
        public string WebAPIKey = "AIzaSyDJvKu4ATxDADOOZ8GmCB-O288bV6KMh94";
        public event Action<CalendarPickerResult> Closed; // 팝업이 닫힐 때 발생하는 이벤트 정의

        // 기본 생성자
        public CalendarPickerPopupViewModel() : base()
        {
            SelectedDate = new DateTime(2021, 6, 13); // 선택된 날짜를 초기화
           
        }

        // 선택된 날짜를 지우는 명령
        public ICommand ClearCommand => new Command(() =>
        {
            SelectedDate = null; // 선택된 날짜를 null로 설정
        });

        public ICommand SuccessCommand => new Command(async () =>
        {
            // 선택된 날짜를 가져옵니다.
            DateTime selectedDate = SelectedDate ?? DateTime.Today;

            // 팝업을 닫음
            await PopupNavigation.Instance.PopAsync();

            // FoodDB 페이지로 이동하고 선택된 날짜를 전달합니다.
            await Application.Current.MainPage.Navigation.PushAsync(new FoodDB(selectedDate));
        });

        public ICommand FoodCommand => new Command(async () =>
        {
            DateTime selectedDate = SelectedDate ?? DateTime.Today;

            // 팝업을 닫음
            await PopupNavigation.Instance.PopAsync();

            // FoodDB 페이지로 이동하고 선택된 날짜를 전달합니다.
            await Application.Current.MainPage.Navigation.PushAsync(new DietPage(selectedDate));
        });

        // 취소되는 경우를 처리하는 명령
        public ICommand CancelCommand => new Command(async () =>
        {
            // Closed 이벤트를 발생시키고 선택된 날짜 없음을 전달
            Closed?.Invoke(new CalendarPickerResult() { IsSuccess = false });

            // 팝업을 닫음
            await PopupNavigation.Instance.PopAsync();
        });

        private DateTime _shownDate = DateTime.Today; // 표시할 날짜 필드 선언 및 초기화

        public DateTime ShownDate
        {
            get => _shownDate; // 표시할 날짜 가져오기
            set => SetProperty(ref _shownDate, value); // 표시할 날짜 설정 및 변경 시 Notify
        }

        private WeekLayout _calendarLayout = WeekLayout.Month; // 달력 레이아웃 필드 선언 및 초기화

        public WeekLayout CalendarLayout
        {
            get => _calendarLayout; // 달력 레이아웃 가져오기
            set => SetProperty(ref _calendarLayout, value); // 달력 레이아웃 설정 및 변경 시 Notify
        }

        private DateTime? _selectedDate; // 선택된 날짜 필드 선언

        public DateTime? SelectedDate
        {
            get => _selectedDate; // 선택된 날짜 가져오기
            set => SetProperty(ref _selectedDate, value); // 선택된 날짜 설정 및 변경 시 Notify
        }

        private DateTime _minimumDate = new DateTime(1900, 1, 1); // 최소 날짜 필드 선언 및 초기화

        public DateTime MinimumDate
        {
            get => _minimumDate; // 최소 날짜 가져오기
            set => SetProperty(ref _minimumDate, value); // 최소 날짜 설정 및 변경 시 Notify
        }

        private DateTime _maximumDate = DateTime.Today.AddDays(30);


        public DateTime MaximumDate
        {
            get => _maximumDate; // 최대 날짜 가져오기
            set => SetProperty(ref _maximumDate, value); // 최대 날짜 설정 및 변경 시 Notify
        }
    }
}
