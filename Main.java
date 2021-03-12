package com.company;
import com.mysql.cj.protocol.Resultset;

import java.sql.*;
import java.sql.Statement;
import java.util.Scanner;

public class Main {
    static Connection con;
    static Statement stmt;

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_1234", "root", "password");
            stmt = con.createStatement();
        } catch (SQLException err) {
            System.out.println(err.getMessage());
        }


	// write your code here
        try {
            System.out.println(" \nPick an option : \n(1) Teacher Login \n(2) Student Login \n");
            int option = input.nextInt();
            switch (option) {
                case 1:
                    boolean nameFound = false;
                    System.out.println("Please enter your name :");
                    String inputName = input.next();
                    String sql = "select * from teachers";
                    ResultSet rs = stmt.executeQuery(sql);
                    while(rs.next()) {
                        String teacherName1 = rs.getString("First_Name");
                        if (inputName.equals(teacherName1)) {
                            nameFound = true;
                            break;
                        }
                    };
                    if  (nameFound=true){
                        showDataToTeacher(stmt);
                    }

                    break;
                case 2:
                    System.out.println("Please enter your personal number :");
                    boolean numberFound = false;
                    int inputPrNumber = input.nextInt();

                    String cmd = "select * from students";
                    ResultSet result = stmt.executeQuery(cmd);
                    while(result.next())
                    {
                        int personal_number = result.getInt("Personal_Number");

                        if(inputPrNumber==personal_number){
                            numberFound = true;
                            break;
                        }
                    }
                    if  (numberFound=true){
                        showDataToStudent(stmt);
                    }
                    break;
                default:
                    System.out.println("No valid choice, try again\n");
            }
    } catch (Exception err){
            System.out.println(err.getMessage());
        }
    }

    public static void showDataToTeacher(Statement stmt){
        Scanner input = new Scanner(System.in);
        try {
            System.out.println(" \nPick an option : \n(1) Available Course Details\n(2) All Student Personal Details \n(3) All Education Details \n(4) Active Students Details \n");
            int option = input.nextInt();
            switch (option) {
                case 1:
                    // See Course Details
                    String cmd = "";
                    ResultSet result;
                    cmd = "select * from courses";
                    result = stmt.executeQuery(cmd);
                    System.out.println("Available Course Details\n");
                    while (result.next()) {
                        int courseId = result.getInt("Course_Id");
                        String courseName = result.getString("Course_Name");
                        int points = result.getInt("Points");
                        System.out.printf(" Course_Id: %d, Course_Name: %s, Points:%d", courseId, courseName, points);
                        System.out.println("\n");
                    }
                    break;
                case 2:
                    // See Student Details

                    cmd = "select * from students";
                    result = stmt.executeQuery(cmd);
                    System.out.println("\n************************************************************\n");
                    System.out.println("All Students Personal Details\n");
                    while (result.next()) {
                        int personalNumber = result.getInt("Personal_Number");
                        String studentName = result.getString("Student_Name");
                        int telephoneNumber = result.getInt("Telephone_Number");
                        String emailId = result.getString("Email_Id");

                        System.out.printf(" personalNumber: %d, studentName: %s, telephoneNumber:%d, emailId:%s", personalNumber, studentName, telephoneNumber, emailId);
                        System.out.println("\n");
                    }
                    break;
                case 3:
                    // See Education Details

                    cmd = "select * from educations";
                    result = stmt.executeQuery(cmd);
                    System.out.println("\n************************************************************\n");
                    System.out.println("All Education Details\n");
                    while (result.next()) {
                        int educationId = result.getInt("Education_Id");
                        String educationName = result.getString("Education_Name");
                        int totalPoints = result.getInt("Total_Points");

                        System.out.printf(" educationId: %d, educationName: %s, totalPoints:%d", educationId, educationName, totalPoints);
                        System.out.println("\n");
                    }
                    break;
                case 4:
                    // See Active Students Details

                    cmd = "select * from brief_details";
                    result = stmt.executeQuery(cmd);
                    System.out.println("\n************************************************************\n");
                    System.out.println("Active Students Details\n");
                    while (result.next()) {
                        int personalNumber = result.getInt("Personal_Number");
                        String studentName = result.getString("Student_Name");
                        String courseName = result.getString("Course_Name");
                        String responsibleTeacher = result.getString("Responsible_Teacher");
                        Date  startDate = result.getDate("Start_Date");
                        Date endDate = result.getDate("Start_Date");


                        System.out.printf(" personalNumber: %d, studentName: %s, courseName:%s, responsibleTeacher:%s, startDate:%s, endDate:%s", personalNumber, studentName, courseName, responsibleTeacher, startDate, endDate);
                        System.out.println("\n");
                    }
                    break;
                default:
                    System.out.println("No valid choice, try again\n");
            }
        }
        catch(Exception err)
        {
            System.out.println(err.getMessage());
        }

    }
    public static void showDataToStudent(Statement stmt){
        try{
            // See Course Details
            String cmd = "";
            ResultSet result;
            cmd = "select * from courses";
            result = stmt.executeQuery(cmd);
            System.out.println("Available Course Details\n");
            while (result.next()) {
                int courseId = result.getInt("Course_Id");
                String courseName = result.getString("Course_Name");
                int points = result.getInt("Points");
                System.out.printf(" Course_Id: %d, Course_Name: %s, Points:%d", courseId, courseName, points);
                System.out.println("\n");
            }
            // See Education Details

            cmd = "select * from educations";
            result = stmt.executeQuery(cmd);
            System.out.println("\n************************************************************\n");
            System.out.println("All Education Details\n");
            while (result.next()) {
                int educationId = result.getInt("Education_Id");
                String educationName = result.getString("Education_Name");
                int totalPoints = result.getInt("Total_Points");

                System.out.printf(" educationId: %d, educationName: %s, totalPoints:%d", educationId, educationName, totalPoints);
                System.out.println("\n");
            }
        }
        catch(Exception err)
        {
            System.out.println(err.getMessage());
        }

    }

}

