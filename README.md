# Fluboard

Calendar wall-board-display built with Flutter and ❤️

## Goals
Build calendar board ([DAKBoard alternative](https://dakboard.com/)) which easy to install and easy to customize. The app should be support to install in embedded PC such as Raspberry Pi, Banana Pi etc. and should be run on any Operating Systems.

## Screenshots

![Desktop](https://user-images.githubusercontent.com/343957/192685237-9839192d-b38d-427d-81eb-1c4c395aebbd.png)

<img width="806" alt="Desktop Screen" src="https://user-images.githubusercontent.com/343957/182877109-97d8d6a4-814e-40d2-b1b4-640249dce2e8.png">

![Settings Screen](https://user-images.githubusercontent.com/343957/192685407-8841d943-9442-41af-9a85-0ac27bd4ba3c.png)
![Account](https://user-images.githubusercontent.com/343957/192685540-366f4ef6-0bc5-40c9-b346-9ec9471274bd.png)

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
- [x] Integration with Google Calendar
- [x] Integration with Google Tasks
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
| Linux  |     ✅    |  ✅   |
| Windows  |     ✅    |  ✅   |
| Tablet  |     ✅    |  ✅   |
| iPad  |     ✅    |  ✅   |
