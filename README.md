# Nepali Date Converter

NepaliDateConverter is a Date Conversion library for converting Nepali Date to English & vice versa written in Swift. 

# Installation

**Using Cocoapod:**

1. Add following in your Podfile

```
pod 'NepaliDateConverter'
```
2. Install the pod by typing ```pod install``` in your terminal
3. After installation, add ```import NepaliDateConverter``` on top of your file wherever you want to use this library

**Manual Installation:**

Copy
1. DateConverter.swit 
2. NepaliDateTranslator.swift

files present in ```NepaliDateConverter/Core``` location to your project. 

# Details

This library is written for the purpose of converting Nepali date to English & vice versa. You can also use this library to translate Date Components to its Nepali Counterparts. 
Date (Nepali or English) in this library is represented as a struct named DateModel. DateModel contains three properties: year, month & day.

✅Nepali to English Conversion

✅English to Nepali Conversion

✅Unit Tests

# How to use

**1. Date Conversion:**

```
let converter = DateConverter()

/*
Nepali date to English Conversion
Result is DateModel containing english date i.e 1993-07-01
*/

let nepDate1 = DateModel(year: 2050, month: 03, day: 17)
let engDate1 = converter.getEnglishDate(nepaliDate: nepDate1) 

/*
English to Nepali Conversion
Result is DateModel containing Nepali Date i.e 2075-12-27
*/

let engDate1 = DateModel(year: 2019, month: 04, day: 10)
let nepDate1 = converter.getNepaliDate(englishDate: engDate1)

```


**2. Nepali Translation**

You can use this feature of the library to translate date, month, year to its Nepali Counterpart.

```
let translator = NepaliDateTranslator()

let firstMonth = translator.getMonth(month: 1) // बैशाख
let thirteen = translator.getNumber(number: 13) // १३
let wednesday = translator.getDay(day: 4) // बुध
```

# Contribution

If you want to contribute to this project, You can always create a PR against **dev** branch.

# License

The MIT License (MIT)

Please see the LICENSE file for more information.
