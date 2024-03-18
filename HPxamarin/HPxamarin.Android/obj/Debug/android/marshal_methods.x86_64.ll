; ModuleID = 'obj/Debug/android/marshal_methods.x86_64.ll'
source_filename = "obj/Debug/android/marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android"


%struct.MonoImage = type opaque

%struct.MonoClass = type opaque

%struct.MarshalMethodsManagedClass = type {
	i32,; uint32_t token
	%struct.MonoClass*; MonoClass* klass
}

%struct.MarshalMethodName = type {
	i64,; uint64_t id
	i8*; char* name
}

%class._JNIEnv = type opaque

%class._jobject = type {
	i8; uint8_t b
}

%class._jclass = type {
	i8; uint8_t b
}

%class._jstring = type {
	i8; uint8_t b
}

%class._jthrowable = type {
	i8; uint8_t b
}

%class._jarray = type {
	i8; uint8_t b
}

%class._jobjectArray = type {
	i8; uint8_t b
}

%class._jbooleanArray = type {
	i8; uint8_t b
}

%class._jbyteArray = type {
	i8; uint8_t b
}

%class._jcharArray = type {
	i8; uint8_t b
}

%class._jshortArray = type {
	i8; uint8_t b
}

%class._jintArray = type {
	i8; uint8_t b
}

%class._jlongArray = type {
	i8; uint8_t b
}

%class._jfloatArray = type {
	i8; uint8_t b
}

%class._jdoubleArray = type {
	i8; uint8_t b
}

; assembly_image_cache
@assembly_image_cache = local_unnamed_addr global [0 x %struct.MonoImage*] zeroinitializer, align 8
; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = local_unnamed_addr constant [264 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 53
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 16
	i64 181099460066822533, ; 2: Microcharts.Droid.dll => 0x28364ffda4c4985 => 14
	i64 210515253464952879, ; 3: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 42
	i64 232391251801502327, ; 4: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 80
	i64 263803244706540312, ; 5: Rg.Plugins.Popup.dll => 0x3a937a743542b18 => 20
	i64 295915112840604065, ; 6: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 81
	i64 316157742385208084, ; 7: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 47
	i64 464346026994987652, ; 8: System.Reactive.dll => 0x671b04057e67284 => 28
	i64 634308326490598313, ; 9: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 65
	i64 702024105029695270, ; 10: System.Drawing.Common => 0x9be17343c0e7726 => 1
	i64 720058930071658100, ; 11: Xamarin.AndroidX.Legacy.Support.Core.UI => 0x9fe29c82844de74 => 58
	i64 872800313462103108, ; 12: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 52
	i64 887546508555532406, ; 13: Microcharts.Forms => 0xc5132d8dc173876 => 15
	i64 940822596282819491, ; 14: System.Transactions => 0xd0e792aa81923a3 => 113
	i64 996343623809489702, ; 15: Xamarin.Forms.Platform => 0xdd3b93f3b63db26 => 96
	i64 1000557547492888992, ; 16: Mono.Security.dll => 0xde2b1c9cba651a0 => 128
	i64 1120440138749646132, ; 17: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 98
	i64 1315114680217950157, ; 18: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 37
	i64 1416135423712704079, ; 19: Microcharts => 0x13a71faa343e364f => 13
	i64 1425944114962822056, ; 20: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 4
	i64 1624659445732251991, ; 21: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 35
	i64 1628611045998245443, ; 22: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 67
	i64 1636321030536304333, ; 23: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 59
	i64 1731380447121279447, ; 24: Newtonsoft.Json => 0x18071957e9b889d7 => 19
	i64 1795316252682057001, ; 25: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 36
	i64 1836611346387731153, ; 26: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 80
	i64 1875917498431009007, ; 27: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 33
	i64 1981742497975770890, ; 28: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 66
	i64 1986553961460820075, ; 29: Xamarin.CommunityToolkit => 0x1b91a84d8004686b => 91
	i64 2064708342624596306, ; 30: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 103
	i64 2133195048986300728, ; 31: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 19
	i64 2136356949452311481, ; 32: Xamarin.AndroidX.MultiDex.dll => 0x1da5dd539d8acbb9 => 71
	i64 2165725771938924357, ; 33: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 40
	i64 2262844636196693701, ; 34: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 52
	i64 2284400282711631002, ; 35: System.Web.Services => 0x1fb3d1f42fd4249a => 118
	i64 2304837677853103545, ; 36: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 79
	i64 2329709569556905518, ; 37: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 62
	i64 2470498323731680442, ; 38: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 46
	i64 2479423007379663237, ; 39: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 86
	i64 2483508130846785077, ; 40: HPxamarin.Android.dll => 0x2277317c9feabe35 => 0
	i64 2497223385847772520, ; 41: System.Runtime => 0x22a7eb7046413568 => 29
	i64 2547086958574651984, ; 42: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 32
	i64 2592350477072141967, ; 43: System.Xml.dll => 0x23f9e10627330e8f => 30
	i64 2624866290265602282, ; 44: mscorlib.dll => 0x246d65fbde2db8ea => 17
	i64 2668049510182046531, ; 45: MvvmHelpers => 0x2506d0e4c18e4b43 => 18
	i64 2675056674728672190, ; 46: CustomCalendarControl => 0x251fb5df633d7bbe => 6
	i64 2694427813909235223, ; 47: Xamarin.AndroidX.Preference.dll => 0x256487d230fe0617 => 75
	i64 2787234703088983483, ; 48: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 82
	i64 2960931600190307745, ; 49: Xamarin.Forms.Core => 0x2917579a49927da1 => 93
	i64 2973416776963745376, ; 50: XamForms.Controls.Calendar.dll => 0x2943b2ce081c6660 => 108
	i64 3017704767998173186, ; 51: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 98
	i64 3122911337338800527, ; 52: Microcharts.dll => 0x2b56cf50bf1e898f => 13
	i64 3289520064315143713, ; 53: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 61
	i64 3303437397778967116, ; 54: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 34
	i64 3311221304742556517, ; 55: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 27
	i64 3344514922410554693, ; 56: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 106
	i64 3493805808809882663, ; 57: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 84
	i64 3522470458906976663, ; 58: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 83
	i64 3531994851595924923, ; 59: System.Numerics => 0x31042a9aade235bb => 26
	i64 3571415421602489686, ; 60: System.Runtime.dll => 0x319037675df7e556 => 29
	i64 3716579019761409177, ; 61: netstandard.dll => 0x3393f0ed5c8c5c99 => 111
	i64 3727469159507183293, ; 62: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 78
	i64 3772598417116884899, ; 63: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 53
	i64 4009997192427317104, ; 64: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 122
	i64 4201423742386704971, ; 65: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 47
	i64 4523676002271688167, ; 66: MvvmHelpers.dll => 0x3ec7535b4a5cf5e7 => 18
	i64 4525561845656915374, ; 67: System.ServiceModel.Internals => 0x3ece06856b710dae => 110
	i64 4636684751163556186, ; 68: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 88
	i64 4759461199762736555, ; 69: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 64
	i64 4782108999019072045, ; 70: Xamarin.AndroidX.AsyncLayoutInflater.dll => 0x425d76cc43bb0a2d => 39
	i64 4794310189461587505, ; 71: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 32
	i64 4795410492532947900, ; 72: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 83
	i64 5014122067821173399, ; 73: HPxamarin.Android => 0x4595bd7468ed9a97 => 0
	i64 5039590358946894597, ; 74: HPxamarin => 0x45f038bb06835305 => 10
	i64 5081566143765835342, ; 75: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 5
	i64 5099468265966638712, ; 76: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 5
	i64 5142919913060024034, ; 77: Xamarin.Forms.Platform.Android.dll => 0x475f52699e39bee2 => 95
	i64 5203618020066742981, ; 78: Xamarin.Essentials => 0x4836f704f0e652c5 => 92
	i64 5205316157927637098, ; 79: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 69
	i64 5348796042099802469, ; 80: Xamarin.AndroidX.Media => 0x4a3abda9415fc165 => 70
	i64 5375264076663995773, ; 81: Xamarin.Forms.PancakeView => 0x4a98c632c779bd7d => 94
	i64 5376510917114486089, ; 82: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 86
	i64 5408338804355907810, ; 83: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 85
	i64 5446034149219586269, ; 84: System.Diagnostics.Debug => 0x4b94333452e150dd => 119
	i64 5451019430259338467, ; 85: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 45
	i64 5507995362134886206, ; 86: System.Core.dll => 0x4c705499688c873e => 24
	i64 5692067934154308417, ; 87: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 90
	i64 5757522595884336624, ; 88: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 43
	i64 5814345312393086621, ; 89: Xamarin.AndroidX.Preference => 0x50b0b44182a5c69d => 75
	i64 5896680224035167651, ; 90: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 63
	i64 6085203216496545422, ; 91: Xamarin.Forms.Platform.dll => 0x5472fc15a9574e8e => 96
	i64 6086316965293125504, ; 92: FormsViewGroup.dll => 0x5476f10882baef80 => 9
	i64 6218967553231149354, ; 93: Firebase.Auth.dll => 0x564e360a4805d92a => 7
	i64 6319713645133255417, ; 94: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 65
	i64 6401687960814735282, ; 95: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 62
	i64 6504860066809920875, ; 96: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 40
	i64 6548213210057960872, ; 97: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 50
	i64 6591024623626361694, ; 98: System.Web.Services.dll => 0x5b7805f9751a1b5e => 118
	i64 6659513131007730089, ; 99: Xamarin.AndroidX.Legacy.Support.Core.UI.dll => 0x5c6b57e8b6c3e1a9 => 58
	i64 6671798237668743565, ; 100: SkiaSharp => 0x5c96fd260152998d => 21
	i64 6876862101832370452, ; 101: System.Xml.Linq => 0x5f6f85a57d108914 => 31
	i64 6894844156784520562, ; 102: System.Numerics.Vectors => 0x5faf683aead1ad72 => 27
	i64 7036436454368433159, ; 103: Xamarin.AndroidX.Legacy.Support.V4.dll => 0x61a671acb33d5407 => 60
	i64 7103753931438454322, ; 104: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 57
	i64 7111211609209905225, ; 105: Xamarin.Plugin.Calendar => 0x62b0194821972049 => 107
	i64 7141577505875122296, ; 106: System.Runtime.InteropServices.WindowsRuntime.dll => 0x631bfae7659b5878 => 2
	i64 7204980051946441770, ; 107: XamForms.Controls.Calendar => 0x63fd3b2f020b0c2a => 108
	i64 7270811800166795866, ; 108: System.Linq => 0x64e71ccf51a90a5a => 124
	i64 7338192458477945005, ; 109: System.Reflection => 0x65d67f295d0740ad => 120
	i64 7488575175965059935, ; 110: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 31
	i64 7489048572193775167, ; 111: System.ObjectModel => 0x67ee71ff6b419e3f => 129
	i64 7602111570124318452, ; 112: System.Reactive => 0x698020320025a6f4 => 28
	i64 7635363394907363464, ; 113: Xamarin.Forms.Core.dll => 0x69f6428dc4795888 => 93
	i64 7637365915383206639, ; 114: Xamarin.Essentials.dll => 0x69fd5fd5e61792ef => 92
	i64 7654504624184590948, ; 115: System.Net.Http => 0x6a3a4366801b8264 => 3
	i64 7735352534559001595, ; 116: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 102
	i64 7820441508502274321, ; 117: System.Data => 0x6c87ca1e14ff8111 => 112
	i64 7836164640616011524, ; 118: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 35
	i64 7927939710195668715, ; 119: SkiaSharp.Views.Android.dll => 0x6e05b32992ed16eb => 22
	i64 8044118961405839122, ; 120: System.ComponentModel.Composition => 0x6fa2739369944712 => 117
	i64 8064050204834738623, ; 121: System.Collections.dll => 0x6fe942efa61731bf => 123
	i64 8083354569033831015, ; 122: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 61
	i64 8103644804370223335, ; 123: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 114
	i64 8113615946733131500, ; 124: System.Reflection.Extensions => 0x70995ab73cf916ec => 125
	i64 8167236081217502503, ; 125: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 11
	i64 8185542183669246576, ; 126: System.Collections => 0x7198e33f4794aa70 => 123
	i64 8187102936927221770, ; 127: SkiaSharp.Views.Forms => 0x719e6ebe771ab80a => 23
	i64 8187640529827139739, ; 128: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 105
	i64 8290740647658429042, ; 129: System.Runtime.Extensions => 0x730ea0b15c929a72 => 131
	i64 8398329775253868912, ; 130: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 44
	i64 8400357532724379117, ; 131: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 74
	i64 8426919725312979251, ; 132: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 64
	i64 8598790081731763592, ; 133: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 55
	i64 8601935802264776013, ; 134: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 85
	i64 8626175481042262068, ; 135: Java.Interop => 0x77b654e585b55834 => 11
	i64 8639588376636138208, ; 136: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 73
	i64 8684531736582871431, ; 137: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 116
	i64 8702320156596882678, ; 138: Firebase.dll => 0x78c4da1357adccf6 => 8
	i64 8853378295825400934, ; 139: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 101
	i64 8951477988056063522, ; 140: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 77
	i64 9057635389615298436, ; 141: LiteDB => 0x7db32f65bf06d784 => 12
	i64 9162065988803407493, ; 142: XamForms.Controls.Calendar.Droid.dll => 0x7f2632795f50ae85 => 109
	i64 9296667808972889535, ; 143: LiteDB.dll => 0x8104661dcca35dbf => 12
	i64 9312692141327339315, ; 144: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 90
	i64 9324707631942237306, ; 145: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 36
	i64 9662334977499516867, ; 146: System.Numerics.dll => 0x8617827802b0cfc3 => 26
	i64 9678050649315576968, ; 147: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 46
	i64 9711637524876806384, ; 148: Xamarin.AndroidX.Media.dll => 0x86c6aadfd9a2c8f0 => 70
	i64 9808709177481450983, ; 149: Mono.Android.dll => 0x881f890734e555e7 => 16
	i64 9825649861376906464, ; 150: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 43
	i64 9834056768316610435, ; 151: System.Transactions.dll => 0x8879968718899783 => 113
	i64 9907349773706910547, ; 152: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 55
	i64 9998632235833408227, ; 153: Mono.Security => 0x8ac2470b209ebae3 => 128
	i64 10038780035334861115, ; 154: System.Net.Http.dll => 0x8b50e941206af13b => 3
	i64 10144742755892837524, ; 155: Firebase => 0x8cc95dc98eb5bc94 => 8
	i64 10226222362177979215, ; 156: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 103
	i64 10229024438826829339, ; 157: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 50
	i64 10321854143672141184, ; 158: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 100
	i64 10360651442923773544, ; 159: System.Text.Encoding => 0x8fc86d98211c1e68 => 127
	i64 10376576884623852283, ; 160: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 84
	i64 10406448008575299332, ; 161: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 106
	i64 10430153318873392755, ; 162: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 48
	i64 10566960649245365243, ; 163: System.Globalization.dll => 0x92a562b96dcd13fb => 130
	i64 10714184849103829812, ; 164: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 131
	i64 10847732767863316357, ; 165: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 37
	i64 11023048688141570732, ; 166: System.Core => 0x98f9bc61168392ac => 24
	i64 11037814507248023548, ; 167: System.Xml => 0x992e31d0412bf7fc => 30
	i64 11122995063473561350, ; 168: Xamarin.CommunityToolkit.dll => 0x9a5cd113fcc3df06 => 91
	i64 11162124722117608902, ; 169: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 89
	i64 11340910727871153756, ; 170: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 49
	i64 11345533118204769135, ; 171: XamForms.Controls.Calendar.Droid => 0x9d736e428206736f => 109
	i64 11392833485892708388, ; 172: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 76
	i64 11529969570048099689, ; 173: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 89
	i64 11578238080964724296, ; 174: Xamarin.AndroidX.Legacy.Support.V4 => 0xa0ae2a30c4cd8648 => 60
	i64 11580057168383206117, ; 175: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 33
	i64 11591352189662810718, ; 176: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 82
	i64 11597940890313164233, ; 177: netstandard => 0xa0f429ca8d1805c9 => 111
	i64 11666126733838079721, ; 178: Xamarin.Plugin.Calendar.dll => 0xa1e66874631b56e9 => 107
	i64 11672361001936329215, ; 179: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 57
	i64 11743665907891708234, ; 180: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 121
	i64 12123043025855404482, ; 181: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 125
	i64 12137774235383566651, ; 182: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 87
	i64 12201331334810686224, ; 183: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 122
	i64 12451044538927396471, ; 184: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 56
	i64 12466513435562512481, ; 185: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 68
	i64 12487638416075308985, ; 186: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 51
	i64 12528155905152483962, ; 187: Firebase.Auth => 0xaddcf36b3153827a => 7
	i64 12538491095302438457, ; 188: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 41
	i64 12550732019250633519, ; 189: System.IO.Compression => 0xae2d28465e8e1b2f => 115
	i64 12700543734426720211, ; 190: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 42
	i64 12828192437253469131, ; 191: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 104
	i64 12963446364377008305, ; 192: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 1
	i64 13129914918964716986, ; 193: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 54
	i64 13370592475155966277, ; 194: System.Runtime.Serialization => 0xb98de304062ea945 => 4
	i64 13401370062847626945, ; 195: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 87
	i64 13403416310143541304, ; 196: Microcharts.Droid => 0xba02801ea6c86038 => 14
	i64 13404347523447273790, ; 197: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 44
	i64 13454009404024712428, ; 198: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 99
	i64 13465488254036897740, ; 199: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 102
	i64 13491513212026656886, ; 200: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 38
	i64 13492263892638604996, ; 201: SkiaSharp.Views.Forms.dll => 0xbb3e2686788d9ec4 => 23
	i64 13572454107664307259, ; 202: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 78
	i64 13647894001087880694, ; 203: System.Data.dll => 0xbd670f48cb071df6 => 112
	i64 13828521679616088467, ; 204: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 101
	i64 13941370548478642935, ; 205: CustomCalendarControl.dll => 0xc179b2a638298af7 => 6
	i64 13959074834287824816, ; 206: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 56
	i64 13967638549803255703, ; 207: Xamarin.Forms.Platform.Android => 0xc1d70541e0134797 => 95
	i64 14124974489674258913, ; 208: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 41
	i64 14125464355221830302, ; 209: System.Threading.dll => 0xc407bafdbc707a9e => 126
	i64 14172845254133543601, ; 210: Xamarin.AndroidX.MultiDex => 0xc4b00faaed35f2b1 => 71
	i64 14261073672896646636, ; 211: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 76
	i64 14327695147300244862, ; 212: System.Reflection.dll => 0xc6d632d338eb4d7e => 120
	i64 14486659737292545672, ; 213: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 63
	i64 14495724990987328804, ; 214: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 79
	i64 14644440854989303794, ; 215: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 69
	i64 14792063746108907174, ; 216: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 99
	i64 14852515768018889994, ; 217: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 49
	i64 14987728460634540364, ; 218: System.IO.Compression.dll => 0xcfff1ba06622494c => 115
	i64 14988210264188246988, ; 219: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 51
	i64 15076659072870671916, ; 220: System.ObjectModel.dll => 0xd13b0d8c1620662c => 129
	i64 15133485256822086103, ; 221: System.Linq.dll => 0xd204f0a9127dd9d7 => 124
	i64 15150743910298169673, ; 222: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 77
	i64 15279429628684179188, ; 223: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 105
	i64 15370334346939861994, ; 224: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 48
	i64 15526743539506359484, ; 225: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 127
	i64 15582737692548360875, ; 226: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 67
	i64 15609085926864131306, ; 227: System.dll => 0xd89e9cf3334914ea => 25
	i64 15777549416145007739, ; 228: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 81
	i64 15810740023422282496, ; 229: Xamarin.Forms.Xaml => 0xdb6b08484c22eb00 => 97
	i64 15817206913877585035, ; 230: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 121
	i64 16154507427712707110, ; 231: System => 0xe03056ea4e39aa26 => 25
	i64 16324796876805858114, ; 232: SkiaSharp.dll => 0xe28d5444586b6342 => 21
	i64 16423015068819898779, ; 233: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 104
	i64 16565028646146589191, ; 234: System.ComponentModel.Composition.dll => 0xe5e2cdc9d3bcc207 => 117
	i64 16621146507174665210, ; 235: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 45
	i64 16677317093839702854, ; 236: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 74
	i64 16822611501064131242, ; 237: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 114
	i64 16833383113903931215, ; 238: mscorlib => 0xe99c30c1484d7f4f => 17
	i64 16866861824412579935, ; 239: System.Runtime.InteropServices.WindowsRuntime => 0xea132176ffb5785f => 2
	i64 17001062948826229159, ; 240: Microcharts.Forms.dll => 0xebefe8ad2cd7a9a7 => 15
	i64 17024911836938395553, ; 241: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 34
	i64 17031351772568316411, ; 242: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 72
	i64 17037200463775726619, ; 243: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 59
	i64 17285063141349522879, ; 244: Rg.Plugins.Popup => 0xefe0e158cc55fdbf => 20
	i64 17544493274320527064, ; 245: Xamarin.AndroidX.AsyncLayoutInflater => 0xf37a8fada41aded8 => 39
	i64 17627500474728259406, ; 246: System.Globalization => 0xf4a176498a351f4e => 130
	i64 17671790519499593115, ; 247: SkiaSharp.Views.Android => 0xf53ecfd92be3959b => 22
	i64 17685921127322830888, ; 248: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 119
	i64 17704177640604968747, ; 249: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 68
	i64 17710060891934109755, ; 250: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 66
	i64 17827832363535584534, ; 251: Xamarin.Forms.PancakeView.dll => 0xf7692f1427c04d16 => 94
	i64 17882897186074144999, ; 252: FormsViewGroup => 0xf82cd03e3ac830e7 => 9
	i64 17891337867145587222, ; 253: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 100
	i64 17892495832318972303, ; 254: Xamarin.Forms.Xaml.dll => 0xf84eea293687918f => 97
	i64 17928294245072900555, ; 255: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 116
	i64 18025913125965088385, ; 256: System.Threading => 0xfa28e87b91334681 => 126
	i64 18055680380163862563, ; 257: HPxamarin.dll => 0xfa92a9a485a83023 => 10
	i64 18116111925905154859, ; 258: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 38
	i64 18121036031235206392, ; 259: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 72
	i64 18129453464017766560, ; 260: System.ServiceModel.Internals.dll => 0xfb98c1df1ec108a0 => 110
	i64 18260797123374478311, ; 261: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 54
	i64 18305135509493619199, ; 262: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 73
	i64 18380184030268848184 ; 263: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 88
], align 16
@assembly_image_cache_indices = local_unnamed_addr constant [264 x i32] [
	i32 53, i32 16, i32 14, i32 42, i32 80, i32 20, i32 81, i32 47, ; 0..7
	i32 28, i32 65, i32 1, i32 58, i32 52, i32 15, i32 113, i32 96, ; 8..15
	i32 128, i32 98, i32 37, i32 13, i32 4, i32 35, i32 67, i32 59, ; 16..23
	i32 19, i32 36, i32 80, i32 33, i32 66, i32 91, i32 103, i32 19, ; 24..31
	i32 71, i32 40, i32 52, i32 118, i32 79, i32 62, i32 46, i32 86, ; 32..39
	i32 0, i32 29, i32 32, i32 30, i32 17, i32 18, i32 6, i32 75, ; 40..47
	i32 82, i32 93, i32 108, i32 98, i32 13, i32 61, i32 34, i32 27, ; 48..55
	i32 106, i32 84, i32 83, i32 26, i32 29, i32 111, i32 78, i32 53, ; 56..63
	i32 122, i32 47, i32 18, i32 110, i32 88, i32 64, i32 39, i32 32, ; 64..71
	i32 83, i32 0, i32 10, i32 5, i32 5, i32 95, i32 92, i32 69, ; 72..79
	i32 70, i32 94, i32 86, i32 85, i32 119, i32 45, i32 24, i32 90, ; 80..87
	i32 43, i32 75, i32 63, i32 96, i32 9, i32 7, i32 65, i32 62, ; 88..95
	i32 40, i32 50, i32 118, i32 58, i32 21, i32 31, i32 27, i32 60, ; 96..103
	i32 57, i32 107, i32 2, i32 108, i32 124, i32 120, i32 31, i32 129, ; 104..111
	i32 28, i32 93, i32 92, i32 3, i32 102, i32 112, i32 35, i32 22, ; 112..119
	i32 117, i32 123, i32 61, i32 114, i32 125, i32 11, i32 123, i32 23, ; 120..127
	i32 105, i32 131, i32 44, i32 74, i32 64, i32 55, i32 85, i32 11, ; 128..135
	i32 73, i32 116, i32 8, i32 101, i32 77, i32 12, i32 109, i32 12, ; 136..143
	i32 90, i32 36, i32 26, i32 46, i32 70, i32 16, i32 43, i32 113, ; 144..151
	i32 55, i32 128, i32 3, i32 8, i32 103, i32 50, i32 100, i32 127, ; 152..159
	i32 84, i32 106, i32 48, i32 130, i32 131, i32 37, i32 24, i32 30, ; 160..167
	i32 91, i32 89, i32 49, i32 109, i32 76, i32 89, i32 60, i32 33, ; 168..175
	i32 82, i32 111, i32 107, i32 57, i32 121, i32 125, i32 87, i32 122, ; 176..183
	i32 56, i32 68, i32 51, i32 7, i32 41, i32 115, i32 42, i32 104, ; 184..191
	i32 1, i32 54, i32 4, i32 87, i32 14, i32 44, i32 99, i32 102, ; 192..199
	i32 38, i32 23, i32 78, i32 112, i32 101, i32 6, i32 56, i32 95, ; 200..207
	i32 41, i32 126, i32 71, i32 76, i32 120, i32 63, i32 79, i32 69, ; 208..215
	i32 99, i32 49, i32 115, i32 51, i32 129, i32 124, i32 77, i32 105, ; 216..223
	i32 48, i32 127, i32 67, i32 25, i32 81, i32 97, i32 121, i32 25, ; 224..231
	i32 21, i32 104, i32 117, i32 45, i32 74, i32 114, i32 17, i32 2, ; 232..239
	i32 15, i32 34, i32 72, i32 59, i32 20, i32 39, i32 130, i32 22, ; 240..247
	i32 119, i32 68, i32 66, i32 94, i32 9, i32 100, i32 97, i32 116, ; 248..255
	i32 126, i32 10, i32 38, i32 72, i32 110, i32 54, i32 73, i32 88 ; 264..263
], align 16

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 8; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 8

; Function attributes: "frame-pointer"="none" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn writeonly
define void @xamarin_app_init (void (i32, i32, i32, i8**)* %fn) local_unnamed_addr #0
{
	store void (i32, i32, i32, i8**)* %fn, void (i32, i32, i32, i8**)** @get_function_pointer, align 8
	ret void
}

; Names of classes in which marshal methods reside
@mm_class_names = local_unnamed_addr constant [0 x i8*] zeroinitializer, align 8
@__MarshalMethodName_name.0 = internal constant [1 x i8] c"\00", align 1

; mm_method_names
@mm_method_names = local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	; 0
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		i8* getelementptr inbounds ([1 x i8], [1 x i8]* @__MarshalMethodName_name.0, i32 0, i32 0); name
	}
], align 16; end of 'mm_method_names' array


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="none" "target-cpu"="x86-64" "target-features"="+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="none" "target-cpu"="x86-64" "target-features"="+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
!llvm.linker.options = !{}
