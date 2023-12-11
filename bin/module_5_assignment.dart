// A. Define an interface named Role:
abstract class Role {
  void displayRole();
}

// B. Create a class Person:
class Person implements Role {
  String name;
  int age;
  String address;
  Role role;

  Person(this.name, this.age, this.address, this.role);

  // Getter methods
  String getName() => name;
  int getAge() => age;
  String getAddress() => address;

  // Implementing Role interface
  @override
  void displayRole() {
    role.displayRole();
  }
}

// C. Create a class Student that extends Person:
class Student extends Person {
  int studentID;
  double averageScore; // Non-nullable field, must be initialized
  List<double> courseScores; // Non-nullable field, must be initialized

  // Updated constructor to initialize averageScore and courseScores
  Student(String name, int age, String address, this.studentID)
      : averageScore = 0.0, // Provide an initial value
        courseScores = [], // Provide an initial value
        super(name, age, address, StudentRole());

  // Override displayRole method
  @override
  void displayRole() {
    print("Role: Student");
    super.displayRole();
    print("Average Score: $averageScore");
  }

  // Method to calculate average score
  void calculateAverageScore() {
    if (courseScores.isNotEmpty) {
      averageScore = courseScores.reduce((a, b) => a + b) / courseScores.length;
    }
  }
}

// D. Create another class Teacher that extends Person:
class Teacher extends Person {
  int teacherID;
  List<String> coursesTaught;

  Teacher(String name, int age, String address, this.teacherID)
      : coursesTaught = [], // Provide an initial value
        super(name, age, address, TeacherRole());

  // Override displayRole method
  @override
  void displayRole() {
    print("Role: Teacher");
    super.displayRole();
    print("Courses Taught:");
    for (String course in coursesTaught) {
      print("- $course");
    }
  }
}

// E. Create a class StudentManagementSystem:
class StudentManagementSystem {
  static void main() {
    // Create instances of Student and Teacher classes
    var student = Student("John Doe", 20, "123 Main St", 123);
    var teacher = Teacher("Mrs. Smith", 35, "456 Oak St", 456);

    // Set attributes using appropriate methods
    student.courseScores = [90, 85, 82];
    student.calculateAverageScore();

    teacher.coursesTaught = ["Math", "English", "Bangla"];

    // Use displayRole method to display the role of each person
    print("Student Information:");
    student.displayRole();
    print("\nTeacher Information:");
    teacher.displayRole();
  }
}

// Role implementations for Student and Teacher
class StudentRole implements Role {
  @override
  void displayRole() {
    // No specific implementation for Student role
  }
}

class TeacherRole implements Role {
  @override
  void displayRole() {
    // No specific implementation for Teacher role
  }
}

void main() {
  StudentManagementSystem.main();
}
