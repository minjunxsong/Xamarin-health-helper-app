using Rg.Plugins.Popup.Pages; // Rg.Plugins.Popup 패키지에서 PopupPage 클래스를 사용하기 위한 using 문
using HPxamarin.Model; // 사용자 정의 모델 클래스를 사용하기 위한 using 문
using HPxamarin.ViewModels; // 사용자 정의 뷰모델 클래스를 사용하기 위한 using 문
using System; // 시스템 네임스페이스를 사용하기 위한 using 문
using Xamarin.Forms.Xaml; // XAML 리소스를 사용하기 위한 using 문

namespace HPxamarin
{
    [XamlCompilation(XamlCompilationOptions.Compile)] // XAML 컴파일 옵션 지정
    public partial class CalendarPickerPopup : PopupPage // PopupPage를 상속받는 CalendarPickerPopup 클래스 정의
    {

        private readonly Action<CalendarPickerResult> _onClosedPopup; // CalendarPickerPopup이 닫힐 때 호출할 액션 필드 선언

        // 기본 생성자
        public CalendarPickerPopup()
        {
            // 기본 생성자로 생성될 때의 초기화 로직
        }

        // CalendarPickerPopup이 닫힐 때 호출할 액션을 전달받는 생성자
        public CalendarPickerPopup(Action<CalendarPickerResult> onClosedPopup)
        {
            _onClosedPopup = onClosedPopup; // 전달받은 액션을 필드에 저장
            InitializeComponent(); // XAML 파일과 연결된 InitializeComponent 메서드 호출
        }

        // 페이지가 표시될 때 호출되는 메서드 재정의
        protected override void OnAppearing()
        {
            base.OnAppearing(); // 부모 클래스의 OnAppearing 메서드 호출

            // 바인딩 컨텍스트가 CalendarPickerPopupViewModel 타입인 경우
            if (BindingContext is CalendarPickerPopupViewModel vm)
                vm.Closed += _onClosedPopup; // 뷰모델의 Closed 이벤트에 액션을 추가
        }

        // 페이지가 사라질 때 호출되는 메서드 재정의
        protected override void OnDisappearing()
        {
            // 바인딩 컨텍스트가 CalendarPickerPopupViewModel 타입인 경우
            if (BindingContext is CalendarPickerPopupViewModel vm)
                vm.Closed -= _onClosedPopup; // 뷰모델의 Closed 이벤트에서 액션을 제거

            base.OnDisappearing(); // 부모 클래스의 OnDisappearing 메서드 호출
        }
    }
}
