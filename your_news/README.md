# App README

Implementation Guidelines

# 1. State Management

For state management, I chose GetX. I chosed getx because I am more comfortable with getx and other than that it got lots of benefits such as routing and dependency injection.

# 2. External Libraries

Here's a list of the external libraries I used:

- GetX: For state management and routing.
- GetStorage: For storing datas.
- Google nav bar: for bottom navigator to route through pages.
- Page Transition: for splash screen.

I chosed this libraries to enhance functionality and improve performance, ensuring that the app runs smoothly and meets the needs of users.

# 3. Code Quality

I focused on maintaining high code quality by adhering to best practices. The code is modular, with clear separation of concerns. Error handling is in place to manage issues gracefully, especially in asynchronous operations. Performance optimizations were made to ensure the app runs efficiently, and optimizing image assets.

# 4. UI Implementation

I have implemented the UI just like the figma design as much as possible, though I have added my own adjustments, and I made it to be responsive and pixel-perfect, closely following the Figma design provided. I paid attention to details to ensure a smooth and visually appealing user experience. The app’s layout adjusts well to different screen sizes and orientations.

# 5. Testing

Although I didn't used unit tests, I performed thorough manual testing. This approach allowed me to test the app's functionality in real-world scenarios and ensure that everything works as expected. I focused on testing core functionalities, user interactions, and edge cases to ensure the app is robust.

# 6. Version Control

I used Git for version control. I made commits regularly to capture the progress and document changes. The commit messages are descriptive and follow a clear format to track the development process effectively.

Post-Implementation Questions

# 1. State Management

I chose GetX for its simplicity and comprehensive feature set. It streamlines state management and routing, which helps in keeping the code clean and maintainable. And as I mentioned earlier, I am more familiar with getx, and thats the reason I chosed that.

# 2. Performance Optimization

To optimize performance, I implemented caching strategies were applied to improve the efficiency of network requests.

# 3. Error Handling

As for Error handling, I managed it through try-catch blocks in asynchronous code, and error messages are displayed to the user when necessary. This approach ensures that errors are caught and addressed without crashing the app.

# 4. Testing Strategy

Manual testing was performed to verify the functionality of the app. This included testing various user scenarios and edge cases to ensure the app behaves as expected. While unit tests were not used, this hands-on approach provided a practical understanding of the app's performance.

# 5. Architecture & Scalability

I made the app to follow a modular architecture, by creating components,that are designed to be reusable and extendable.
