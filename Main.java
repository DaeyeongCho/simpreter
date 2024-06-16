import java.io.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        parser p = new parser();

        while (true) {
            System.out.print("> ");
            String input = scanner.nextLine();

            if (input.equals("exit")) {
                break;
            }

            try {
                Lexer lexer = new Lexer(new StringReader(input));
                p.setScanner(lexer);
                p.parse(); 
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
            }
        }
    }
}
