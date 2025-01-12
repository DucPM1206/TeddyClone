# Teddy Clone - E-commerce Application

A Spring Boot based e-commerce application for selling teddy bears and related products.

## Prerequisites

Before running this application, make sure you have the following installed:
- Java Development Kit (JDK) 17 or later
- MySQL Server 8.0 or later
- Maven (optional, as project includes Maven wrapper)
- Your favorite IDE (IntelliJ IDEA, Eclipse, or VS Code recommended)

## Technology Stack

- Spring Boot 3.1.1
- Spring Security
- Spring Data JPA
- Thymeleaf Template Engine
- MySQL Database
- Maven Build Tool

## Project Setup

### 1. Database Setup

1. Start your MySQL server
2. Create a new database (you can name it `shoes` or any preferred name)
3. Import the database schema and initial data:
   ```bash
   mysql -u your_username -p your_database_name < database.sql
   ```

### 2. Application Configuration

1. Navigate to `src/main/resources/application.properties`
2. Update the following properties with your database configuration:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/your_database_name
   spring.datasource.username=your_username
   spring.datasource.password=your_password
   ```

### 3. Building and Running the Application

#### Using Maven Wrapper (Recommended)

For Windows:
```bash
# Build the project
.\mvnw clean install

# Run the application
.\mvnw spring-boot:run
```

For Linux/Mac:
```bash
# Build the project
./mvnw clean install

# Run the application
./mvnw spring-boot:run
```

#### Using Maven (if installed globally)

```bash
# Build the project
mvn clean install

# Run the application
mvn spring-boot:run
```

### 4. Accessing the Application

Once the application starts successfully:
- Open your web browser
- Navigate to `http://localhost:8080`
- The application should be up and running!

## Project Structure

```
TeddyClone/
├── src/
│   ├── main/
│   │   ├── java/com/web/application/
│   │   │   ├── controller/     # Web controllers
│   │   │   ├── model/          # Entity classes
│   │   │   ├── repository/     # Data access layer
│   │   │   ├── service/        # Business logic layer
│   │   │   └── config/         # Configuration classes
│   │   └── resources/
│   │       ├── static/         # Static resources (CSS, JS)
│   │       └── templates/      # Thymeleaf templates
│   └── test/                   # Test classes
├── database.sql                # Database schema and initial data
├── pom.xml                     # Maven configuration
└── README.md                   # This file
```

## Troubleshooting

1. **Database Connection Issues**
   - Verify MySQL is running
   - Check database credentials in application.properties
   - Ensure database schema is properly imported

2. **Build Failures**
   - Ensure JDK 17 is installed and JAVA_HOME is properly set
   - Try clearing Maven cache: `.\mvnw clean`

3. **Runtime Errors**
   - Check application logs in console
   - Verify all required dependencies are installed
   - Ensure proper database configuration

## Support

If you encounter any issues or need assistance:
1. Check the troubleshooting section above
2. Review application logs for error messages
3. Verify all prerequisites are properly installed

## License

This project is intended for educational purposes.
