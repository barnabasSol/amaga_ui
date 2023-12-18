# amaga

# Flutter Project Setup

This project is structured to ensure a clean architecture and separation of concerns along with repository pattern to abstract buisness logic in the respective features.

## Project Structure

The `lib` directory contains the main code for the Flutter application. It is organized into two main subdirectories: `features` and `services`.

### Features

The `features` directory contains different functionalities of the application. Each feature has its own directory. For example, the `auth` directory contains all the authentication-related code.

The `auth` directory is further divided into `pages`, `widgets`, and `repository`:

- `pages`: Contains the screens related to authentication.
- `widgets`: Contains the reusable UI components used in the authentication pages.
- `repository`: Contains the code to manage data for the authentication feature.

### Services

The `services` directory contains the code that handles API calls. The methods in the relevant `repository` folder are used to make these API calls.

If an API call fails, the repository uses data from the `db` folder, which holds the SQLite database, as a fallback.

### Models

The `models` directory contains classes that handle the parsing of JSON to Dart objects. These models define the structure of the data your application uses.

### Shared

The `shared` directory holds Data Transfer Objects (DTOs) and types to handle the data that is exchanged between the server and the client.

---

# Guide to Test Logins

## Step 1: Navigate to the Auth Repository

In the `auth` directory, you'll find the `repository` folder. This contains the logic for login and its implementation.

## Step 2: Default Credential 

In the `LoginLogicImpl` class there's a function called `loginValidate()`, this is the function that handles client input validation but as a placeholder, there's a default credential with `abebe` and password: `123`, this function will be updated later.   

## Step 3: Understand the Login Logic

There's a function called `handleSuccessfulLogin()`. This function shows how different roles are navigated to their respective pages upon successful login. the function will be further separated and abstracted later.

## Step 4: Test Different Roles

There's another function called `authResponse()`. This function is a placeholder for when the API responds with a token and a role. To test out the different pages, change the value of the variable called `role` in the `authResponse()` function. Depending on the role you set, the login should lead to the correct page.

When the API is ready this function will be foiled in `Future<>` and gets to utilize the login API call in the `servics` directory
