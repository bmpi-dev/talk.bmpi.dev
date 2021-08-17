---
# try also 'default' to start simple
theme: seriph
layout: cover
# random image from a curated Unsplash collection by Anthony
# like them? see https://unsplash.com/collections/94734566/slidev
background: https://source.unsplash.com/collection/94734566/1920x1080
# apply any windi css classes to the current slide
class: 'text-center'
# https://sli.dev/custom/highlighters.html
highlighter: shiki
# show line numbers in code blocks
lineNumbers: false
# some information about the slides, markdown enabled
info: |
  ## Slidev Starter Template
  Presentation slides for developers.

  Learn more at [Sli.dev](https://sli.dev)
---

# i18N in Java

Presented by [@Dawei Ma](https://twitter.com/madawei2699)

---

## G11N/i18N/L10N

![](https://img.bmpi.dev/53875fc9-00ac-e8e2-8d91-06399755dcba.png)

> Internationalization is the process of designing an application so that it can be adapted to various **languages** and **regions** <ins>without engineering changes</ins>.

---

An internationalized program has the following characteristics:

- With the <ins>addition of localized data</ins>, the <ins>same executable</ins> can run worldwide.
- Textual elements, such as status messages and the GUI component labels, are <ins>not hardcoded</ins> in the program. Instead they are stored outside the source code and <ins>retrieved dynamically</ins>.
- Support for <ins>new languages</ins> does not require recompilation.
- Culturally-dependent data, such as <ins>dates and currencies</ins>, appear in formats that conform to the end user's region and language.
- It can be <ins>localized quickly</ins>.

---

## Java i18n Demo

```java
import java.util.Locale;
import java.util.ResourceBundle;

public class Hello {

    public static void main(String[] args) {
        String language = "en";
        String country = "US";

        if (args.length == 1) {
            language = args[0];
        } else if (args.length == 2) {
            language = args[0];
            country = args[1];
        }

        var locale = new Locale(language, country);
        var messages = ResourceBundle.getBundle("messages", locale);

        System.out.print(messages.getString("hello") + " ");
        System.out.println(messages.getString("world"));
    }
}
```

---

messages_en.properties
```
hello=Hello(en)
world=World
```
messages_en_US.properties
```
world=World(en_US)
```
messages_es.properties
```
hello=Hola
world=Mundo
```
execute java
```
java Hello.java
java Hello.java es
```

<v-click>

```
Hello(en) World(en_US)
Hola Mundo
```

</v-click>

---

## Java i18N workflow

1. Create the Properties Files
```
greetings = Hello
farewell = Goodbye
inquiry = How are you?
```

2. Define the **Locale**
```
aLocale = new Locale("en","US");
```

3. Create a **ResourceBundle**
```
messages = ResourceBundle.getBundle("MessagesBundle", currentLocale);
```
```
MessagesBundle_en_US.properties
MessagesBundle_fr_FR.properties
MessagesBundle_de_DE.properties
```

4. Fetch the Text from the ResourceBundle
```
String msg1 = messages.getString("greetings");
```

---

How does an internationalized program identify the appropriate language and region of its end users?

<v-click>

It references a <ins>Locale</ins> object.

</v-click>

---

## Locale in i18N

> Locale is the user-specific location and cultural information managed by a computer. [(RFC6365)](https://datatracker.ietf.org/doc/html/rfc6365)
>
> A concept or identifier used by programmers to represent a particular collection of cultural, regional, or linguistic preferences.

---

## Tags for Identifying Languages(BCP 47)

<img src="https://img.bmpi.dev/d1feae2e-8820-2112-2354-60b8de71589c.png" width="700"/>

```
langtag = language["-" script]["-" region]*("-" variant)*("-" extension)["-" privateuse]
```

---

## i18N IETF Standard

- [Terminology Used in Internationalization in the IETF](https://datatracker.ietf.org/doc/html/rfc6365)
- [IETF BCP<sub>Best Current Practice</sub> 47<sup>Language Tag Registry Update (LTRU)</sup>](https://www.rfc-editor.org/info/bcp47)
- [Making Sense of Language Tags](https://www.slideserve.com/shantell/making-sense-of-language-tags)

---

## Locale in Java

[java.util.Locale](https://github1s.com/openjdk/jdk/blob/master/src/java.base/share/classes/java/util/Locale.java)

- Implements IETF [BCP 47](https://www.rfc-editor.org/info/bcp47)
  - [RFC 4647](https://www.rfc-editor.org/rfc/rfc4647.txt): Matching of Language Tags
    - <em>Filtering</em> is used to get all matching locales
    - <em>lookup</em> is to choose the best matching locale
  - [RFC 5646](https://www.rfc-editor.org/rfc/rfc5646.txt): Tags for Identifying Languages
- Refers to IETF [RFC 2616](https://www.rfc-editor.org/rfc/rfc2616.txt)
  - [Quality Values](https://datatracker.ietf.org/doc/html/rfc2616#section-3.9)
- Refers to ISO
  - [ISO 639](https://www.iso.org/iso-639-language-codes.html): Language codes
  - [ISO 3166](https://www.iso.org/iso-3166-country-codes.html): Country codes
  - [ISO 15924](https://unicode.org/iso15924/iso15924-codes.html): Script code

---

How does Java get messages by locale identify?

<v-click>

It's <em>ResourceBundle</em>!

</v-click>

---

## ResourceBundle in Java

[java.util.ResourceBundle](https://github1s.com/openjdk/jdk/blob/master/src/java.base/share/classes/java/util/ResourceBundle.java)

<a href="http://www.gdzwk.com/#/blog/i18n"> <img src="https://img.bmpi.dev/b542cf39-3946-24ed-a492-27f1f044d515.png" width="45%" height="45%" /></a>

---

## Others for i18N

- [Common Language Data Repository(CLDR)](http://cldr.unicode.org/)<sup>Incorporated into JDK 8</sup>
  - <ins>Locale-specific patterns for formatting and parsing</ins>: dates, times, timezones, numbers and currency values, measurement units,…
  - <ins>Translations of names</ins>: languages, scripts, countries and regions, currencies, eras, months, weekdays, day periods, time zones, cities, and time units, and sequences (and search keywords),…
  - <ins>Language & script information</ins>: characters used; plural cases; gender of lists; capitalization; rules for sorting & searching; writing direction; transliteration rules;…
  - <ins>Country information</ins>: language usage, currency information, calendar preference, week conventions,…
  - <ins>Validity</ins>: Definitions, aliases, and validity information for Unicode locales, languages, scripts, regions, and extensions,…
- [UNICODE LOCALE DATA MARKUP LANGUAGE (LDML)](http://www.unicode.org/reports/tr35/)

---

## Outside of Java

- [GUN gettext](https://www.gnu.org/software/gettext/)
  - C
  - C++
  - Python
  - PHP
  - Elixir
- [ICU](http://site.icu-project.org/)
  - Code Page Conversion
  - Collation
  - Formatting(CLDR)
  - Time Calculations
  - Unicode Support
  - Regular Expression
  - Bidi
  - Text Boundaries

---

## Further reading list

- [Building a minimal i18n library](https://janmonschke.com/building-a-minimal-i18n-library)
- [Clojure uses standard Java ResourceBundle](https://github.com/feldi/clojure-i18n/blob/master/src/i18n/core.clj)
- [awesome-i18n](https://github.com/jpomykala/awesome-i18n)
- [awesome-i18n](https://github.com/mrhota/awesome-i18n)
- [A Beginner’s Guide to Internationalization in Java](https://phrase.com/blog/posts/a-beginners-guide-to-java-internationalization/)
- [国际化与本地化](https://www.bmpi.dev/dev/i18n-l10n/)
- [国际化分析与处理](http://www.gdzwk.com/#/blog/i18n)
- [ECMAScript® 2021 Internationalization API Specification](https://402.ecma-international.org/)

---
layout: center
class: text-center
---

# Thanks!
