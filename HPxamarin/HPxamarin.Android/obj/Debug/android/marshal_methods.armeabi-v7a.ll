; ModuleID = 'obj/Debug/android/marshal_methods.armeabi-v7a.ll'
source_filename = "obj/Debug/android/marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android"


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
@assembly_image_cache = local_unnamed_addr global [0 x %struct.MonoImage*] zeroinitializer, align 4
; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = local_unnamed_addr constant [264 x i32] [
	i32 32687329, ; 0: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 65
	i32 34715100, ; 1: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 99
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 19
	i32 57263871, ; 3: Xamarin.Forms.Core.dll => 0x369c6ff => 93
	i32 101534019, ; 4: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 81
	i32 120558881, ; 5: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 81
	i32 134690465, ; 6: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 103
	i32 165246403, ; 7: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 42
	i32 182336117, ; 8: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 83
	i32 209399409, ; 9: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 40
	i32 220171995, ; 10: System.Diagnostics.Debug => 0xd1f8edb => 119
	i32 230216969, ; 11: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 59
	i32 231814094, ; 12: System.Globalization => 0xdd133ce => 130
	i32 232815796, ; 13: System.Web.Services => 0xde07cb4 => 118
	i32 261689757, ; 14: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 45
	i32 278686392, ; 15: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 63
	i32 280482487, ; 16: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 57
	i32 318968648, ; 17: Xamarin.AndroidX.Activity.dll => 0x13031348 => 32
	i32 321597661, ; 18: System.Numerics => 0x132b30dd => 26
	i32 342366114, ; 19: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 61
	i32 393699800, ; 20: Firebase => 0x177761d8 => 8
	i32 402672763, ; 21: Xamarin.Plugin.Calendar => 0x18004c7b => 107
	i32 441335492, ; 22: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 44
	i32 442521989, ; 23: Xamarin.Essentials => 0x1a605985 => 92
	i32 442565967, ; 24: System.Collections => 0x1a61054f => 123
	i32 450948140, ; 25: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 56
	i32 459347974, ; 26: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 122
	i32 465846621, ; 27: mscorlib => 0x1bc4415d => 17
	i32 469710990, ; 28: System.dll => 0x1bff388e => 25
	i32 476646585, ; 29: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 57
	i32 486930444, ; 30: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 69
	i32 498788369, ; 31: System.ObjectModel => 0x1dbae811 => 129
	i32 525008092, ; 32: SkiaSharp.dll => 0x1f4afcdc => 21
	i32 526420162, ; 33: System.Transactions.dll => 0x1f6088c2 => 113
	i32 527452488, ; 34: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 103
	i32 545304856, ; 35: System.Runtime.Extensions => 0x2080b118 => 131
	i32 605376203, ; 36: System.IO.Compression.FileSystem => 0x24154ecb => 116
	i32 610194910, ; 37: System.Reactive.dll => 0x245ed5de => 28
	i32 627609679, ; 38: Xamarin.AndroidX.CustomView => 0x2568904f => 50
	i32 639843206, ; 39: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 55
	i32 663517072, ; 40: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 88
	i32 666292255, ; 41: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 37
	i32 690569205, ; 42: System.Xml.Linq.dll => 0x29293ff5 => 31
	i32 691348768, ; 43: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 105
	i32 700284507, ; 44: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 100
	i32 720511267, ; 45: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 104
	i32 775507847, ; 46: System.IO.Compression => 0x2e394f87 => 115
	i32 809851609, ; 47: System.Drawing.Common.dll => 0x30455ad9 => 1
	i32 835661280, ; 48: MvvmHelpers.dll => 0x31cf2de0 => 18
	i32 843511501, ; 49: Xamarin.AndroidX.Print => 0x3246f6cd => 76
	i32 877678880, ; 50: System.Globalization.dll => 0x34505120 => 130
	i32 886248193, ; 51: Microcharts.Droid => 0x34d31301 => 14
	i32 902159924, ; 52: Rg.Plugins.Popup => 0x35c5de34 => 20
	i32 928116545, ; 53: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 99
	i32 937549978, ; 54: CustomCalendarControl.dll => 0x37e1e09a => 6
	i32 955402788, ; 55: Newtonsoft.Json => 0x38f24a24 => 19
	i32 956575887, ; 56: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 104
	i32 967690846, ; 57: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 61
	i32 974778368, ; 58: FormsViewGroup.dll => 0x3a19f000 => 9
	i32 992768348, ; 59: System.Collections.dll => 0x3b2c715c => 123
	i32 1012816738, ; 60: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 80
	i32 1035644815, ; 61: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 36
	i32 1042160112, ; 62: Xamarin.Forms.Platform.dll => 0x3e1e19f0 => 96
	i32 1052210849, ; 63: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 66
	i32 1084122840, ; 64: Xamarin.Kotlin.StdLib => 0x409e66d8 => 102
	i32 1098259244, ; 65: System => 0x41761b2c => 25
	i32 1175144683, ; 66: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 86
	i32 1178241025, ; 67: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 73
	i32 1204270330, ; 68: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 37
	i32 1264511973, ; 69: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 82
	i32 1267360935, ; 70: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 87
	i32 1275534314, ; 71: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 105
	i32 1293217323, ; 72: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 52
	i32 1324164729, ; 73: System.Linq => 0x4eed2679 => 124
	i32 1365406463, ; 74: System.ServiceModel.Internals.dll => 0x516272ff => 110
	i32 1376866003, ; 75: Xamarin.AndroidX.SavedState => 0x52114ed3 => 80
	i32 1379779777, ; 76: System.Resources.ResourceManager => 0x523dc4c1 => 5
	i32 1395857551, ; 77: Xamarin.AndroidX.Media.dll => 0x5333188f => 70
	i32 1406073936, ; 78: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 46
	i32 1457743152, ; 79: System.Runtime.Extensions.dll => 0x56e36530 => 131
	i32 1460219004, ; 80: Xamarin.Forms.Xaml => 0x57092c7c => 97
	i32 1462112819, ; 81: System.IO.Compression.dll => 0x57261233 => 115
	i32 1469204771, ; 82: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 35
	i32 1494302497, ; 83: HPxamarin.Android.dll => 0x59113f21 => 0
	i32 1550322496, ; 84: System.Reflection.Extensions.dll => 0x5c680b40 => 125
	i32 1582372066, ; 85: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 51
	i32 1582526884, ; 86: Microcharts.Forms.dll => 0x5e5371a4 => 15
	i32 1592978981, ; 87: System.Runtime.Serialization.dll => 0x5ef2ee25 => 4
	i32 1622152042, ; 88: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 68
	i32 1624863272, ; 89: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 90
	i32 1635184631, ; 90: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 55
	i32 1636350590, ; 91: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 49
	i32 1639515021, ; 92: System.Net.Http.dll => 0x61b9038d => 3
	i32 1657153582, ; 93: System.Runtime => 0x62c6282e => 29
	i32 1658241508, ; 94: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 84
	i32 1658251792, ; 95: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 98
	i32 1670060433, ; 96: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 45
	i32 1698840827, ; 97: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 101
	i32 1701541528, ; 98: System.Diagnostics.Debug.dll => 0x656b7698 => 119
	i32 1722051300, ; 99: SkiaSharp.Views.Forms => 0x66a46ae4 => 23
	i32 1726116996, ; 100: System.Reflection.dll => 0x66e27484 => 120
	i32 1729485958, ; 101: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 41
	i32 1765942094, ; 102: System.Reflection.Extensions => 0x6942234e => 125
	i32 1766324549, ; 103: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 83
	i32 1776026572, ; 104: System.Core.dll => 0x69dc03cc => 24
	i32 1788241197, ; 105: Xamarin.AndroidX.Fragment => 0x6a96652d => 56
	i32 1808609942, ; 106: Xamarin.AndroidX.Loader => 0x6bcd3296 => 68
	i32 1812481981, ; 107: Xamarin.Plugin.Calendar.dll => 0x6c0847bd => 107
	i32 1813058853, ; 108: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 102
	i32 1813201214, ; 109: Xamarin.Google.Android.Material => 0x6c13413e => 98
	i32 1818569960, ; 110: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 74
	i32 1867746548, ; 111: Xamarin.Essentials.dll => 0x6f538cf4 => 92
	i32 1878053835, ; 112: Xamarin.Forms.Xaml.dll => 0x6ff0d3cb => 97
	i32 1885316902, ; 113: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 38
	i32 1900610850, ; 114: System.Resources.ResourceManager.dll => 0x71490522 => 5
	i32 1904755420, ; 115: System.Runtime.InteropServices.WindowsRuntime.dll => 0x718842dc => 2
	i32 1919157823, ; 116: Xamarin.AndroidX.MultiDex.dll => 0x7264063f => 71
	i32 1983156543, ; 117: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 101
	i32 2019465201, ; 118: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 66
	i32 2055257422, ; 119: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 62
	i32 2079903147, ; 120: System.Runtime.dll => 0x7bf8cdab => 29
	i32 2090596640, ; 121: System.Numerics.Vectors => 0x7c9bf920 => 27
	i32 2097448633, ; 122: Xamarin.AndroidX.Legacy.Support.Core.UI => 0x7d0486b9 => 58
	i32 2113902067, ; 123: Xamarin.Forms.PancakeView.dll => 0x7dff95f3 => 94
	i32 2126786730, ; 124: Xamarin.Forms.Platform.Android => 0x7ec430aa => 95
	i32 2193016926, ; 125: System.ObjectModel.dll => 0x82b6c85e => 129
	i32 2197479321, ; 126: HPxamarin.dll => 0x82fadf99 => 10
	i32 2201107256, ; 127: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 106
	i32 2201231467, ; 128: System.Net.Http => 0x8334206b => 3
	i32 2216717168, ; 129: Firebase.Auth.dll => 0x84206b70 => 7
	i32 2217644978, ; 130: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 86
	i32 2244775296, ; 131: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 69
	i32 2256548716, ; 132: Xamarin.AndroidX.MultiDex => 0x8680336c => 71
	i32 2261435625, ; 133: Xamarin.AndroidX.Legacy.Support.V4.dll => 0x86cac4e9 => 60
	i32 2279755925, ; 134: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 78
	i32 2315684594, ; 135: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 33
	i32 2373047941, ; 136: XamForms.Controls.Calendar.Droid => 0x8d71d685 => 109
	i32 2375020390, ; 137: CustomCalendarControl => 0x8d8fef66 => 6
	i32 2397082276, ; 138: Xamarin.Forms.PancakeView => 0x8ee092a4 => 94
	i32 2403452196, ; 139: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 54
	i32 2409053734, ; 140: Xamarin.AndroidX.Preference.dll => 0x8f973e26 => 75
	i32 2454642406, ; 141: System.Text.Encoding.dll => 0x924edee6 => 127
	i32 2465532216, ; 142: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 44
	i32 2471841756, ; 143: netstandard.dll => 0x93554fdc => 111
	i32 2475788418, ; 144: Java.Interop.dll => 0x93918882 => 11
	i32 2501346920, ; 145: System.Data.DataSetExtensions => 0x95178668 => 114
	i32 2505896520, ; 146: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 65
	i32 2581819634, ; 147: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 87
	i32 2605712449, ; 148: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 106
	i32 2620871830, ; 149: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 49
	i32 2624644809, ; 150: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 53
	i32 2633051222, ; 151: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 63
	i32 2634079625, ; 152: HPxamarin.Android => 0x9d00dd89 => 0
	i32 2701096212, ; 153: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 84
	i32 2715334215, ; 154: System.Threading.Tasks.dll => 0xa1d8b647 => 121
	i32 2732626843, ; 155: Xamarin.AndroidX.Activity => 0xa2e0939b => 32
	i32 2737747696, ; 156: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 35
	i32 2766581644, ; 157: Xamarin.Forms.Core => 0xa4e6af8c => 93
	i32 2770495804, ; 158: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 100
	i32 2778768386, ; 159: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 89
	i32 2779977773, ; 160: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 79
	i32 2795602088, ; 161: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 22
	i32 2810250172, ; 162: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 46
	i32 2819470561, ; 163: System.Xml.dll => 0xa80db4e1 => 30
	i32 2821294376, ; 164: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 79
	i32 2853208004, ; 165: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 89
	i32 2855708567, ; 166: Xamarin.AndroidX.Transition => 0xaa36a797 => 85
	i32 2861816565, ; 167: Rg.Plugins.Popup.dll => 0xaa93daf5 => 20
	i32 2901442782, ; 168: System.Reflection => 0xacf080de => 120
	i32 2903344695, ; 169: System.ComponentModel.Composition => 0xad0d8637 => 117
	i32 2905242038, ; 170: mscorlib.dll => 0xad2a79b6 => 17
	i32 2912489636, ; 171: SkiaSharp.Views.Android => 0xad9910a4 => 22
	i32 2916838712, ; 172: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 90
	i32 2919462931, ; 173: System.Numerics.Vectors.dll => 0xae037813 => 27
	i32 2921128767, ; 174: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 34
	i32 2974793899, ; 175: SkiaSharp.Views.Forms.dll => 0xb14fc0ab => 23
	i32 2978675010, ; 176: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 52
	i32 2996846495, ; 177: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 64
	i32 3016983068, ; 178: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 82
	i32 3024354802, ; 179: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 59
	i32 3036068679, ; 180: Microcharts.Droid.dll => 0xb4f6bb47 => 14
	i32 3044182254, ; 181: FormsViewGroup => 0xb57288ee => 9
	i32 3057625584, ; 182: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 72
	i32 3075834255, ; 183: System.Threading.Tasks => 0xb755818f => 121
	i32 3111772706, ; 184: System.Runtime.Serialization => 0xb979e222 => 4
	i32 3204380047, ; 185: System.Data.dll => 0xbefef58f => 112
	i32 3211777861, ; 186: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 51
	i32 3220365878, ; 187: System.Threading => 0xbff2e236 => 126
	i32 3247949154, ; 188: Mono.Security => 0xc197c562 => 128
	i32 3257332390, ; 189: MvvmHelpers => 0xc226f2a6 => 18
	i32 3258312781, ; 190: Xamarin.AndroidX.CardView => 0xc235e84d => 41
	i32 3267021929, ; 191: Xamarin.AndroidX.AsyncLayoutInflater => 0xc2bacc69 => 39
	i32 3299363146, ; 192: System.Text.Encoding => 0xc4a8494a => 127
	i32 3317135071, ; 193: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 50
	i32 3317144872, ; 194: System.Data => 0xc5b79d28 => 112
	i32 3322403133, ; 195: Firebase.dll => 0xc607d93d => 8
	i32 3340387945, ; 196: SkiaSharp => 0xc71a4669 => 21
	i32 3340431453, ; 197: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 38
	i32 3345895724, ; 198: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 77
	i32 3346324047, ; 199: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 73
	i32 3353484488, ; 200: Xamarin.AndroidX.Legacy.Support.Core.UI.dll => 0xc7e21cc8 => 58
	i32 3353544232, ; 201: Xamarin.CommunityToolkit.dll => 0xc7e30628 => 91
	i32 3362522851, ; 202: Xamarin.AndroidX.Core => 0xc86c06e3 => 48
	i32 3366347497, ; 203: Java.Interop => 0xc8a662e9 => 11
	i32 3374999561, ; 204: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 78
	i32 3404865022, ; 205: System.ServiceModel.Internals => 0xcaf21dfe => 110
	i32 3407215217, ; 206: Xamarin.CommunityToolkit => 0xcb15fa71 => 91
	i32 3429136800, ; 207: System.Xml => 0xcc6479a0 => 30
	i32 3430777524, ; 208: netstandard => 0xcc7d82b4 => 111
	i32 3441283291, ; 209: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 53
	i32 3455791806, ; 210: Microcharts => 0xcdfb32be => 13
	i32 3476120550, ; 211: Mono.Android => 0xcf3163e6 => 16
	i32 3486566296, ; 212: System.Transactions => 0xcfd0c798 => 113
	i32 3493954962, ; 213: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 43
	i32 3501239056, ; 214: Xamarin.AndroidX.AsyncLayoutInflater.dll => 0xd0b0ab10 => 39
	i32 3509114376, ; 215: System.Xml.Linq => 0xd128d608 => 31
	i32 3536029504, ; 216: Xamarin.Forms.Platform.Android.dll => 0xd2c38740 => 95
	i32 3567349600, ; 217: System.ComponentModel.Composition.dll => 0xd4a16f60 => 117
	i32 3586971312, ; 218: XamForms.Controls.Calendar.Droid.dll => 0xd5ccd6b0 => 109
	i32 3596207933, ; 219: LiteDB.dll => 0xd659c73d => 12
	i32 3608519521, ; 220: System.Linq.dll => 0xd715a361 => 124
	i32 3618140916, ; 221: Xamarin.AndroidX.Preference => 0xd7a872f4 => 75
	i32 3627220390, ; 222: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 76
	i32 3629588173, ; 223: LiteDB => 0xd8571ecd => 12
	i32 3632359727, ; 224: Xamarin.Forms.Platform => 0xd881692f => 96
	i32 3633644679, ; 225: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 34
	i32 3641597786, ; 226: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 62
	i32 3668042751, ; 227: Microcharts.dll => 0xdaa1e3ff => 13
	i32 3672681054, ; 228: Mono.Android.dll => 0xdae8aa5e => 16
	i32 3676310014, ; 229: System.Web.Services.dll => 0xdb2009fe => 118
	i32 3682565725, ; 230: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 40
	i32 3684561358, ; 231: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 43
	i32 3684933406, ; 232: System.Runtime.InteropServices.WindowsRuntime => 0xdba39f1e => 2
	i32 3689375977, ; 233: System.Drawing.Common => 0xdbe768e9 => 1
	i32 3706696989, ; 234: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 47
	i32 3718780102, ; 235: Xamarin.AndroidX.Annotation => 0xdda814c6 => 33
	i32 3724971120, ; 236: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 72
	i32 3731644420, ; 237: System.Reactive => 0xde6c6004 => 28
	i32 3758932259, ; 238: Xamarin.AndroidX.Legacy.Support.V4 => 0xe00cc123 => 60
	i32 3786282454, ; 239: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 42
	i32 3822602673, ; 240: Xamarin.AndroidX.Media => 0xe3d849b1 => 70
	i32 3829621856, ; 241: System.Numerics.dll => 0xe4436460 => 26
	i32 3885922214, ; 242: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 85
	i32 3888767677, ; 243: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 77
	i32 3896760992, ; 244: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 48
	i32 3903721208, ; 245: Microcharts.Forms => 0xe8ae0ef8 => 15
	i32 3920810846, ; 246: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 116
	i32 3921031405, ; 247: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 88
	i32 3924940196, ; 248: HPxamarin => 0xe9f1d5a4 => 10
	i32 3931092270, ; 249: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 74
	i32 3945713374, ; 250: System.Data.DataSetExtensions.dll => 0xeb2ecede => 114
	i32 3955647286, ; 251: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 36
	i32 3959773229, ; 252: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 64
	i32 4014908255, ; 253: XamForms.Controls.Calendar => 0xef4ea35f => 108
	i32 4024013275, ; 254: Firebase.Auth => 0xefd991db => 7
	i32 4073602200, ; 255: System.Threading.dll => 0xf2ce3c98 => 126
	i32 4101593132, ; 256: Xamarin.AndroidX.Emoji2 => 0xf479582c => 54
	i32 4105002889, ; 257: Mono.Security.dll => 0xf4ad5f89 => 128
	i32 4151237749, ; 258: System.Core => 0xf76edc75 => 24
	i32 4181436372, ; 259: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 122
	i32 4182413190, ; 260: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 67
	i32 4220811361, ; 261: XamForms.Controls.Calendar.dll => 0xfb947861 => 108
	i32 4256097574, ; 262: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 47
	i32 4292120959 ; 263: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 67
], align 4
@assembly_image_cache_indices = local_unnamed_addr constant [264 x i32] [
	i32 65, i32 99, i32 19, i32 93, i32 81, i32 81, i32 103, i32 42, ; 0..7
	i32 83, i32 40, i32 119, i32 59, i32 130, i32 118, i32 45, i32 63, ; 8..15
	i32 57, i32 32, i32 26, i32 61, i32 8, i32 107, i32 44, i32 92, ; 16..23
	i32 123, i32 56, i32 122, i32 17, i32 25, i32 57, i32 69, i32 129, ; 24..31
	i32 21, i32 113, i32 103, i32 131, i32 116, i32 28, i32 50, i32 55, ; 32..39
	i32 88, i32 37, i32 31, i32 105, i32 100, i32 104, i32 115, i32 1, ; 40..47
	i32 18, i32 76, i32 130, i32 14, i32 20, i32 99, i32 6, i32 19, ; 48..55
	i32 104, i32 61, i32 9, i32 123, i32 80, i32 36, i32 96, i32 66, ; 56..63
	i32 102, i32 25, i32 86, i32 73, i32 37, i32 82, i32 87, i32 105, ; 64..71
	i32 52, i32 124, i32 110, i32 80, i32 5, i32 70, i32 46, i32 131, ; 72..79
	i32 97, i32 115, i32 35, i32 0, i32 125, i32 51, i32 15, i32 4, ; 80..87
	i32 68, i32 90, i32 55, i32 49, i32 3, i32 29, i32 84, i32 98, ; 88..95
	i32 45, i32 101, i32 119, i32 23, i32 120, i32 41, i32 125, i32 83, ; 96..103
	i32 24, i32 56, i32 68, i32 107, i32 102, i32 98, i32 74, i32 92, ; 104..111
	i32 97, i32 38, i32 5, i32 2, i32 71, i32 101, i32 66, i32 62, ; 112..119
	i32 29, i32 27, i32 58, i32 94, i32 95, i32 129, i32 10, i32 106, ; 120..127
	i32 3, i32 7, i32 86, i32 69, i32 71, i32 60, i32 78, i32 33, ; 128..135
	i32 109, i32 6, i32 94, i32 54, i32 75, i32 127, i32 44, i32 111, ; 136..143
	i32 11, i32 114, i32 65, i32 87, i32 106, i32 49, i32 53, i32 63, ; 144..151
	i32 0, i32 84, i32 121, i32 32, i32 35, i32 93, i32 100, i32 89, ; 152..159
	i32 79, i32 22, i32 46, i32 30, i32 79, i32 89, i32 85, i32 20, ; 160..167
	i32 120, i32 117, i32 17, i32 22, i32 90, i32 27, i32 34, i32 23, ; 168..175
	i32 52, i32 64, i32 82, i32 59, i32 14, i32 9, i32 72, i32 121, ; 176..183
	i32 4, i32 112, i32 51, i32 126, i32 128, i32 18, i32 41, i32 39, ; 184..191
	i32 127, i32 50, i32 112, i32 8, i32 21, i32 38, i32 77, i32 73, ; 192..199
	i32 58, i32 91, i32 48, i32 11, i32 78, i32 110, i32 91, i32 30, ; 200..207
	i32 111, i32 53, i32 13, i32 16, i32 113, i32 43, i32 39, i32 31, ; 208..215
	i32 95, i32 117, i32 109, i32 12, i32 124, i32 75, i32 76, i32 12, ; 216..223
	i32 96, i32 34, i32 62, i32 13, i32 16, i32 118, i32 40, i32 43, ; 224..231
	i32 2, i32 1, i32 47, i32 33, i32 72, i32 28, i32 60, i32 42, ; 232..239
	i32 70, i32 26, i32 85, i32 77, i32 48, i32 15, i32 116, i32 88, ; 240..247
	i32 10, i32 74, i32 114, i32 36, i32 64, i32 108, i32 7, i32 126, ; 248..255
	i32 54, i32 128, i32 24, i32 122, i32 67, i32 108, i32 47, i32 67 ; 264..263
], align 4

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 4; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 4

; Function attributes: "frame-pointer"="all" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn writeonly
define void @xamarin_app_init (void (i32, i32, i32, i8**)* %fn) local_unnamed_addr #0
{
	store void (i32, i32, i32, i8**)* %fn, void (i32, i32, i32, i8**)** @get_function_pointer, align 4
	ret void
}

; Names of classes in which marshal methods reside
@mm_class_names = local_unnamed_addr constant [0 x i8*] zeroinitializer, align 4
@__MarshalMethodName_name.0 = internal constant [1 x i8] c"\00", align 1

; mm_method_names
@mm_method_names = local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	; 0
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		i8* getelementptr inbounds ([1 x i8], [1 x i8]* @__MarshalMethodName_name.0, i32 0, i32 0); name
	}
], align 8; end of 'mm_method_names' array


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="all" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="all" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"min_enum_size", i32 4}
!3 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
!llvm.linker.options = !{}
