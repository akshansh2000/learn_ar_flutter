# learn_ar_flutter

**LearnARF** is a [Flutter](https://flutter.dev/) application which uses Google's [ARCore](https://developers.google.com/ar) to spawn 3D models into the real world. Additionally, it uses the [Sceneform SDK](https://github.com/google-ar/sceneform-android-sdk) to make it easier to handle 3D models.

## Prerequisites

* To be able to run this app, make sure your phone has official support for Google's ARCore. Check [this](https://developers.google.com/ar/discover/supported-devices) list to find out.

* Make sure to have the **Flutter Framework** installed. You can install it by visiting their [official site](https://flutter.dev/docs/get-started/install).

* Make sure to have [git](https://git-scm.com/) installed.

## How To

### Testing

If you only want to test the app and not contribute towards the development, you can simply clone the current repository and build the app.

To clone the current repository, run **(in bash/fish/git bash)**:
```bash
git clone https://github.com/akshansh2000/learn_ar_flutter.git
```

Then, navigate to the project directory and build the app. Make sure to connect your mobile device / open an emulator before executing this step.
```bash
cd learn_ar_flutter/
flutter run
```

**Note**: Make sure to have the Flutter tool [in your path](https://flutter.dev/docs/get-started/install/linux#update-your-path) before executing the above. Alternatively, if on Windows, you could use the included **Flutter Console**.

### Contributing

If you want to contribute towards the development of the app, you are more than welcome. To do so, make sure to [create a fork](https://github.com/akshansh2000/learn_ar_flutter/fork) of the current repository.

Also, make sure to go through the [Contributor Guidelines](https://github.com/akshansh2000/learn_ar_flutter/blob/master/CONTRIBUTING.md).

## Using the app

The app has a simple UI now, subject to change during the next couple weeks.

Here is how to add 3D models to the real world:

| #   | To - Do                                                   | Demonstration                                                |
| --- | --------------------------------------------------------- | ------------------------------------------------------------ |
| 1   | Select a model to add (tap on the icon of the model)      | ![Selecting a model](https://i.imgur.com/ugMaQCB.jpg)        |
| 2   | Press `START`                                             | ![Tap on `START`](https://i.imgur.com/kYjxgKO.png)           |
| 3   | Wait for the app to detect a plane                        | ![Wait for plane detection](https://i.imgur.com/zM2hVRM.jpg) |
| 4   | Tap the part of the plane where you want to add the model | ![Tap to add model](https://i.imgur.com/sLguwBW.jpg)         |
