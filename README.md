# amaga

# Flutter Project Setup

This project is structured to ensure a clean architecture and separation of concerns.

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

## Conclusion

This setup ensures that each part of the application has a specific role, making the codebase easier to navigate and maintain.

