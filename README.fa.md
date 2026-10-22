<div dir="rtl" align="right">

[English](README.md) | [فارسی](README.fa.md)

# TicTacToe — بازی دوز

یک بازی دوز دونفره با Flutter. دو نفر روی یک دستگاه نوبتی بازی می‌کنند و امتیازها بین دورهای بازی حفظ می‌شود؛ همه‌چیز هم در یک صفحه قرار دارد.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white)
![Dart SDK](https://img.shields.io/badge/Dart-%5E3.12.0-0175C2?style=flat&logo=dart&logoColor=white)
[![مجوز MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## تصاویر برنامه

| شروع بازی | برد بازیکن O | برد بازیکن X | مساوی |
| :---: | :---: | :---: | :---: |
| <img src="assets/screenshots/TicTacToe.png" alt="صفحهٔ خالی با امتیاز صفر برای هر دو بازیکن و نوبت O" width="200" /> | <img src="assets/screenshots/TicTacToe(1).png" alt="برد بازیکن O با یک خط قطری" width="200" /> | <img src="assets/screenshots/TicTacToe(2).png" alt="برد بازیکن X با یک خط قطری" width="200" /> | <img src="assets/screenshots/TicTacToe(3).png" alt="صفحهٔ پرشده و پایان بازی با نتیجهٔ مساوی" width="200" /> |

این تصاویر در پوشهٔ `assets/screenshots/` قرار دارند و فقط در مستندات استفاده می‌شوند. نیازی نیست آن‌ها را به بخش assets در `pubspec.yaml` اضافه کنید.

## امکانات

- بازی دونفره روی یک دستگاه، در صفحهٔ ۳ × ۳؛ بعد از ریست کامل، بازیکن O شروع می‌کند.
- نمایش نوبت بازیکن و رنگ متفاوت مهره‌ها: سبز برای O و قرمز برای X.
- تشخیص برد در تمام ردیف‌ها، ستون‌ها و قطرها، و تشخیص مساوی وقتی صفحه پر می‌شود.
- جلوگیری از تغییر خانه‌های پرشده و ثبت حرکت جدید بعد از پایان هر دور.
- نمایش امتیاز هر دو بازیکن و حفظ آن‌ها بین دورها.
- دکمهٔ نتیجه برای شروع دور بعد، بدون پاک شدن امتیازها.
- دکمهٔ ریست در نوار بالای صفحه برای پاک کردن صفحه، امتیازها و بازگرداندن نوبت شروع.
- رابط کاربری تیره با ویجت‌های Material در Flutter.

### روند بازی و امتیازدهی

با زدن روی یک خانهٔ خالی، علامت بازیکنی که نوبتش است در آن قرار می‌گیرد. هر برد یک امتیاز به برنده می‌دهد. **در حالت مساوی، هر دو بازیکن یک امتیاز می‌گیرند**؛ منطق فعلی کد همین است.

دکمهٔ **play again** صفحه را خالی می‌کند، ولی امتیازها را نگه می‌دارد. نوبت بعدی هم از دور قبلی ادامه پیدا می‌کند؛ یعنی لزوماً O شروع‌کنندهٔ دور جدید نیست. دکمهٔ **ریست** در نوار بالای صفحه کل بازی را از نو شروع می‌کند: امتیازها صفر می‌شوند و نوبت به O برمی‌گردد.

وضعیت بازی فقط در حافظه نگه داشته می‌شود و بعد از بستن و اجرای دوبارهٔ برنامه ذخیره نمی‌ماند. حریف کامپیوتری، بازی آنلاین، حساب کاربری و بک‌اند در این نسخه وجود ندارد. رابط خود برنامه فعلاً انگلیسی است؛ نسخهٔ فارسی مربوط به مستندات پروژه است.

## تکنولوژی‌ها و معماری

پروژه یک اپ کوچک و تک‌صفحه‌ای Flutter با ساختار مبتنی بر صفحه است. رابط کاربری و قوانین بازی هر دو در `HomeScreen` قرار دارند. لایه‌های جداگانهٔ data، domain یا repository تعریف نشده‌اند و پروژه از Clean Architecture یا MVVM استفاده نمی‌کند.

برای **مدیریت وضعیت (State Management)** از `StatefulWidget` و متد داخلی `setState` استفاده شده است. کلاس `_HomeScreenState` خانه‌های صفحه، نوبت فعلی، تعداد خانه‌های پرشده، نتیجهٔ دور و امتیاز هر دو بازیکن را نگه می‌دارد.

### مشخصات پروژه

- **نام پکیج:** `tictactoe`
- **نسخه:** `1.0.0+1`
- **محدودهٔ Dart SDK:** `^3.12.0`، یعنی از نسخهٔ `3.12.0` تا قبل از `4.0.0`.
- **توضیحات پکیج:** مقدار description در `pubspec.yaml` هنوز متن پیش‌فرض `A new Flutter project.` است.
- **پلتفرم‌های موجود در مخزن:** Android، وب و Windows. در این نسخه از مخزن، پوشه‌های اجرایی iOS، macOS و Linux وجود ندارند.

### پکیج‌ها

- **`flutter`** — وابستگی SDK برای ویجت‌های Material، چیدمان صفحه و اجرای برنامه.
- **`cupertino_icons: ^1.0.8`** — پکیج آیکون‌های Cupertino که در `pubspec.yaml` تعریف شده است؛ صفحهٔ فعلی بازی از آیکون‌های Material استفاده می‌کند.
- **`flutter_test`** — وابستگی توسعه از Flutter SDK برای تست‌نویسی. فعلاً پوشهٔ `test/` در مخزن وجود ندارد.
- **`flutter_lints: ^6.0.0`** — قوانین پیشنهادی تحلیل کد که در `analysis_options.yaml` فعال شده‌اند.

پکیج اضافه‌ای برای State Management، شبکه، ذخیره‌سازی محلی یا رابط کاربری استفاده نشده است. `build_runner` یا ابزار دیگری برای تولید کد هم در پروژه وجود ندارد.

### ساختار پوشه‌ها

<div dir="ltr" align="left">

```text
lib/
├── main.dart                 # Entry point, Application, and MaterialApp
└── screens/
    └── home_screen.dart      # Board, scoreboard, turns, results, and reset logic

assets/
└── screenshots/              # Four images used by the READMEs

android/                      # Android runner and build configuration
web/                          # Web runner, manifest, and icons
windows/                      # Windows runner and CMake configuration
pubspec.yaml                  # Package metadata and dependencies
analysis_options.yaml         # Flutter lint configuration
```

</div>

فایل `main.dart` برنامه را با `Application` اجرا می‌کند و `MaterialApp` صفحهٔ `HomeScreen` را نمایش می‌دهد. در `home_screen.dart`، متد `tapped` حرکت‌ها را ثبت می‌کند، `checkWinner` هشت حالت برد و نتیجهٔ مساوی را بررسی می‌کند و `setResult` نتیجه و امتیازها را به‌روزرسانی می‌کند. متد `clearGameBoard` صفحه را برای دور بعد خالی می‌کند؛ `clearGame` کل بازی و امتیازها را ریست می‌کند.

## نصب و اجرا

### ۱. آماده کردن Flutter و دستگاه هدف

نسخه‌ای از Flutter SDK را نصب کنید که **Dart نسخهٔ 3.12.0 یا بالاتر و پایین‌تر از 4.0.0** را همراه داشته باشد. دستور `flutter` هم باید در `PATH` سیستم در دسترس باشد.

<div dir="ltr" align="left">

```bash
flutter --version
flutter doctor
```

</div>

ابزارهای لازم را بر اساس پلتفرم موردنظرتان آماده کنید:

- **Android:** محیط Android Studio یا Android SDK و یک شبیه‌ساز یا دستگاه متصل. تنظیمات بیلد اندروید Java 17 را هدف گرفته‌اند؛ از JDK سازگار استفاده کنید.
- **وب:** مرورگر Chrome برای اجرای دستور توسعهٔ پایین.
- **Windows:** یک سیستم ویندوزی با Visual Studio و workload با نام **Desktop development with C++**.

### ۲. کلون کردن مخزن

عبارت `YOUR_REPOSITORY_URL` را با آدرس کلون همین مخزن جایگزین کنید. در نسخهٔ محلی بررسی‌شده، آدرسی برای `origin` تنظیم نشده است؛ بنابراین آدرس مشخصی برای سرویس میزبانی فرض نشده است.

<div dir="ltr" align="left">

```bash
git clone "YOUR_REPOSITORY_URL" tictactoe
cd tictactoe
```

</div>

اگر پروژه را از قبل روی سیستم دارید، کافی است وارد پوشهٔ اصلی آن شوید.

### ۳. نصب وابستگی‌ها

<div dir="ltr" align="left">

```bash
flutter pub get
```

</div>

نیازی به اجرای دستور تولید کد نیست. کلید API، فایل تنظیمات محیطی یا سرویس بک‌اند هم لازم ندارید.

### ۴. اجرای برنامه

شبیه‌ساز را روشن کنید یا دستگاه را وصل کنید، سپس دستورهای زیر را اجرا کنید:

<div dir="ltr" align="left">

```bash
flutter devices
flutter run
```

</div>

برای انتخاب مستقیم پلتفرم، یکی از دستورهای زیر را اجرا کنید:

<div dir="ltr" align="left">

```bash
flutter run -d chrome
flutter run -d windows
```

</div>

برای اندروید، از دستور `flutter run -d DEVICE_ID` استفاده کنید و `DEVICE_ID` را با شناسهٔ یک دستگاه اندرویدی از خروجی `flutter devices` جایگزین کنید. بیلد Windows باید روی ویندوز اجرا شود.

### ۵. بررسی کد

<div dir="ltr" align="left">

```bash
flutter analyze
```

</div>

پکیج `flutter_test` در وابستگی‌های توسعه موجود است، اما این نسخه از مخزن هنوز فایل تست ندارد. بعد از اضافه کردن تست‌ها در پوشهٔ `test/`، می‌توانید آن‌ها را با دستور `flutter test` اجرا کنید.

## آمار زبان‌های مخزن

در فایل `.gitattributes`، پوشه‌های اجرایی پلتفرم‌ها با ویژگی `linguist-vendored=true` و فایل‌های Dart تولیدشده، یعنی `*.g.dart` و `*.freezed.dart`، با ویژگی `linguist-generated=true` مشخص شده‌اند. GitHub Linguist این فایل‌ها را در محاسبهٔ سهم زبان‌ها کنار می‌گذارد تا آمار، کد Dart نوشته‌شده برای خود برنامه را نشان دهد. این تنظیمات روی بیلد Flutter یا اجرای برنامه اثری ندارند.

## مجوز

پروژه تحت [مجوز MIT](LICENSE) منتشر شده است. حق نشر © ۲۰۲۶ متعلق به Mehrshad Khodavirdizadeh است.

</div>
