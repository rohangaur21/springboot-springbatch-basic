package com.rgonyx.springbootbatch.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Random;

@Service
public class CustomerDataGeneratorUtils {

    @Value("${file.output.path}")
    private String filePath;

    public String generateCustomerData() throws IOException {
        // Get the absolute path of the file relative to the project directory
        String absolutePath = Paths.get(filePath).toAbsolutePath().toString();

        // Ensure the directory exists
        File file = new File(absolutePath);
        file.getParentFile().mkdirs(); // Create directories if they don't exist

        // Open FileWriter to write CSV
        try (FileWriter writer = new FileWriter(file)) {
            // Write CSV Header
            writer.append("id,firstName,lastName,email,gender,contactNo,country,dob\n");

            // Generate sample data for customers
            String[] firstNames = {"John", "Jane", "Alex", "Chris", "Katie"};
            String[] lastNames = {"Smith", "Johnson", "Williams", "Brown", "Jones"};
            String[] genders = {"Male", "Female"};
            String[] countries = {"USA", "Canada", "UK", "Australia", "India"};
            Random random = new Random();

            for (int i = 1; i <= 1000; i++) {
                String firstName = firstNames[random.nextInt(firstNames.length)];
                String lastName = lastNames[random.nextInt(lastNames.length)];
                String email = generateEmail(firstName, lastName);
                String gender = genders[random.nextInt(genders.length)];
                String contact = generateContact();
                String country = countries[random.nextInt(countries.length)];
                String dob = generateDOB();

                // Append row data
                writer.append(String.format("%d,%s,%s,%s,%s,%s,%s,%s\n",
                        i, firstName, lastName, email, gender, contact, country, dob));
            }
        }

        // Return the absolute path of the generated file
        return absolutePath;
    }

    private String generateEmail(String firstName, String lastName) {
        return firstName.toLowerCase() + "." + lastName.toLowerCase() + "@example.com";
    }

    private String generateContact() {
        Random random = new Random();
        return String.format("+1-%03d-%03d-%04d", random.nextInt(900) + 100, random.nextInt(900) + 100, random.nextInt(9000) + 1000);
    }

    private String generateDOB() {
        Random random = new Random();
        int year = random.nextInt(50) + 1950;
        int month = random.nextInt(12) + 1;
        int day = random.nextInt(28) + 1; // to avoid invalid days for months
        return String.format("%04d-%02d-%02d", year, month, day);
    }
}
