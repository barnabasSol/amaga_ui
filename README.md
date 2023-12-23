# Amaga

## Flutter Project Setup

This project is structured to ensure a clean architecture and separation of concerns along with repository pattern to abstract business logic in the respective features.

### Project Structure

The `lib` directory contains the main code for the Flutter application. It is organized into two main subdirectories: `features` and `services`.

#### Features

The `features` directory contains different functionalities of the application. Each feature has its own directory. For example, the `auth` directory contains all the authentication-related code.

The `auth` directory is further divided into `pages`, `widgets`, and `repository`:

- `pages`: Contains the screens related to authentication.
- `widgets`: Contains the reusable UI components used in the authentication pages.
- `repository`: Contains the code to manage data for the authentication feature.

#### Services

The `services` directory contains the code that handles API calls. The methods in the relevant `repository` folder are used to make these API calls.

If an API call fails, the repository uses data from the `db` folder, which holds the SQLite database, as a fallback.

#### Models

The `models` directory contains classes that handle the parsing of JSON to Dart objects. These models define the structure of the data your application uses.

#### Shared

The `shared` directory holds Data Transfer Objects (DTOs) and types to handle the data that is exchanged between the server and the client.

---

## Guide to Test Logins

### Step 1: Navigate to the Auth Repository

In the `auth` directory, you'll find the `repository` folder. This contains the logic for login and its implementation.

### Step 2: Default Credential 

login with `username - debe` and `password - 123` for register role.
login with `username - abe` and `password - 123` for tester role.
login with `username - fill` and `password - 123` for filler role.
login with `username - main` and `password - 123` for maintainence role.
more will be added for testing later.

### Step 3: Understand the Login Logic

There's a function called `handleSuccessfulLogin()`. This function shows how different roles are navigated to their respective pages upon successful login. the function will be further separated and abstracted later.

### Step 4: Test Different Roles

now the roles are set based on the users that exist in the server.
the api functionality is done til further improvement.


---

## Recent Updates

The login functionality has been completed with the implementation of the API call from services and its use in the auth repository. A loading boolean progress shower has been added on the button for better user experience.

The desktop and phone versions of the pages have been further abstracted by creating separate folders `/phone` and `/desktop` and a `loginpage.dart` where it checks if the device is on mobile or desktop. This ensures a responsive design that makes it flexible to different device form factors.
