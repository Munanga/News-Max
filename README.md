# NewsMax

A clean, cross-platform Flutter news app that delivers the latest headlines powered by **The Guardian Content API**. Browse top stories, filter by category, search for any topic, and read full articles with a beautifully styled reader view.

---

## Features

- **Latest Headlines** — Fetches the 20 most recent articles on launch with pull-to-refresh
- **Category Filtering** — Browse by World, Business, Technology, Sport, Culture, Environment, or Science
- **Full-Text Search** — Search across all Guardian articles by keyword, ranked by relevance
- **Article Reader** — Rich HTML article body with custom typography (Google Fonts · Lora), blockquotes, inline images, and dark-mode aware text colours
- **Dark Mode Support** — Adapts article reader colours to the system theme automatically

---

## Screenshots

> Add screenshots here once the app is running on a device or simulator.

| Home | Category Filter | Article Detail | Search |
|------|----------------|----------------|--------|
| _screenshot_ | _screenshot_ | _screenshot_ | _screenshot_ |

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter 3 / Dart |
| News Data | [The Guardian Open Platform API](https://open-platform.theguardian.com/) |
| HTTP Client | [`http`](https://pub.dev/packages/http) |
| HTML Rendering | [`flutter_html`](https://pub.dev/packages/flutter_html) |
| Typography | [`google_fonts`](https://pub.dev/packages/google_fonts) |
| Date Formatting | [`intl`](https://pub.dev/packages/intl) |
| Link Handling | [`url_launcher`](https://pub.dev/packages/url_launcher) |

---

## Project Structure

```
lib/
├── api/
│   └── get_top_news.dart      # Guardian API calls (top news + search)
├── presentation/
│   ├── home_screen.dart       # Main feed with category filter tabs
│   ├── search_screen.dart     # Keyword search screen
│   └── detail_screen.dart     # Full article reader
├── widgets/
│   └── stateless/
│       └── news_card.dart     # Reusable article card widget
├── utils/
│   └── date_utils.dart        # Date formatting helpers
└── main.dart
```

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) ≥ 3.0
- A free Guardian API key — register at [open-platform.theguardian.com](https://open-platform.theguardian.com/access/)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/<your-username>/newsmax.git
cd newsmax

# 2. Install dependencies
flutter pub get

# 3. Add your Guardian API key
#    Open lib/api/get_top_news.dart and replace the placeholder:
#    String apiKey = 'YOUR_API_KEY_HERE';

# 4. Run the app
flutter run
```

### Supported Platforms

| Platform | Status |
|----------|--------|
| Android | ✅ |
| iOS | ✅ |
| Web | ✅ |
| macOS | ✅ |
| Linux | ✅ |
| Windows | ✅ |

---

## API Reference

This app consumes the [Guardian Content API](https://open-platform.theguardian.com/documentation/).

| Endpoint | Usage |
|----------|-------|
| `GET /search` | Latest headlines (ordered by newest) |
| `GET /search?section=<category>` | Category-filtered headlines |
| `GET /search?q=<query>` | Keyword search (ordered by relevance) |

All requests fetch full article fields (`show-fields=all`) including thumbnail, body HTML, and byline.

---

## License

This project is open source and available under the [MIT License](LICENSE).
