# Fluboard

Calendar wall-board-display built with Flutter and ❤️

## Goals
Build calendar board ([DAKBoard alternative](https://dakboard.com/)) which easy to install and easy to customize. The app should be support to install in embedded PC such as Raspberry Pi, Banana Pi etc. and should be run on any Operating Systems.

## Screenshots

![Desktop](https://user-images.githubusercontent.com/343957/183285085-c9bc1080-affd-458d-902e-28d7fd393cff.png)

<img width="806" alt="Desktop Screen" src="https://user-images.githubusercontent.com/343957/182877109-97d8d6a4-814e-40d2-b1b4-640249dce2e8.png">

![Settings Screen](https://user-images.githubusercontent.com/343957/183296045-63edd95a-afaa-4cb1-968e-8f65217f01ce.png)


## Setup
Don't forget to create `.env` file in the `root` folder and put some configuration variables as follows:
```dotenv
AUTH_CLIENT_ID='....apps.googleusercontent.com'
AUTH_CLIENT_SECRET='XXXX-asdfgh_.....'
```
You can get `AUTH_CLIENT_ID` and `AUTH_CLIENT_SECRET` here [Google Cloud Console](https://console.cloud.google.com/apis/credentials). 
Choose `Desktop` as application type. On OAuth consent screen, add your email as `Test users`. 

## Todo
- [x] Integration with Open Weather
- [ ] Integration with Google Calendar
- [ ] Integration with Google Todo
- [x] Integration with Google Photo
- [x] Provide settings screen
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
