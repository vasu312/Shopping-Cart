# Shopping Cart Project

This project is a simple shopping cart web application developed using JSP, Servlets, MySQL, JSTL, and managed with Maven.

## Description

The shopping cart application allows users to browse items, add them to their cart, and make purchases. It utilizes JSP for the frontend views, Servlets to handle requests/responses, MySQL for the database to store products and user information, JSTL for efficient rendering, and Maven for project management and dependency handling.

## Screenshot

![](test.gif)

## Features

- **User Authentication:** User login and registration functionality.
- **Product Management:** Displaying products, adding them to the cart.
- **Cart Functionality:** Adding/removing items, updating quantities, and checking out.
- **Database Integration:** MySQL database to store user details and product information.
- **Maven Integration:** Easy project management and dependency handling.

## Installation

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/vasu312/Shopping-Cart.git
    ```

2. **Database Setup:**

    - Install MySQL and create a database named `shopping`.
    - Import the database schema and initial data from the provided SQL file.

3. **Configure Database Connection:**

    Update the `src/main/com.botree.utility/DbUtility.java` file with your MySQL database credentials.

4. **Build and Run:**

    ```bash
    cd shopping-cart-project
    mvn clean install
    mvn tomcat7:run
    ```

5. **Access the Application:**

    Open your browser and go to `http://localhost:8080/Shopping-Cart`.

## Technologies Used

- Java
- JSP (JavaServer Pages)
- Servlets
- MySQL
- JSTL (JSP Standard Tag Library)
- Maven

## Contributing

Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/improvement`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add new feature'`).
5. Push to the branch (`git push origin feature/improvement`).
6. Create a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
