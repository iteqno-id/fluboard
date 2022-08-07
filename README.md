# Fluboard

Calendar wall-board-display built with Flutter and ❤️

## Goals
Build calendar board ([DAKBoard alternative](https://dakboard.com/)) which easy to install and easy to customize. The app should be support to install in embedded PC such as Raspberry Pi, Banana Pi etc. and should be run on any Operating Systems.

## Screenshots

![Desktop](https://user-images.githubusercontent.com/343957/183285085-c9bc1080-affd-458d-902e-28d7fd393cff.png)

<img width="806" alt="Desktop Screen" src="https://user-images.githubusercontent.com/343957/182877109-97d8d6a4-814e-40d2-b1b4-640249dce2e8.png">

![Settings Screen](https://user-images.githubusercontent.com/343957/183296045-63edd95a-afaa-4cb1-968e-8f65217f01ce.png)


## Setup
Don't forget to create `````.env````` file in the ```root``` folder and put some configuration variables as follows:
```dotenv
OPEN_WEATHER_API_KEY=your_open_weather_api_key
CITY="Your city name, e.g: Serpong, Banten"
```

## Todo
- [x] Integration with Open Weather
- [ ] Integration with Google Calendar
- [ ] Integration with Google Todo
- [ ] integration with Google Photo
- [ ] Provide settings screen
- [ ] Portrait mode
- [ ] Customizable skin/theme
- [ ] Localization
- [ ] Translation

## Operating System Support
|   OS   | Supported | Tested |
|--------|-----------|--------|
| macOS  |     ✅    |  ✅    |
| Linux  |     ✅    |  ☑️   |
| Windows  |     ✅    |  ☑️   |
| Tablet  |     ✅    |  ☑️   |
| iPad  |     ✅    |  ✅   |
