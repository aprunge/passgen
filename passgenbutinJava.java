import java.util.Random;

public class passgenbutinJava {

    public static void main(String[] args) {
        
        //array of characters for the program to chooese from
        char[] chars = "dn".toCharArray();

        //string builder to hold the password <-- what this guy said.
        StringBuilder sb = new StringBuilder();

        //randomize the characters
        Random random = new Random();

        //loops through the characters and to make a super secure password
        for (int i = 0; i < 2; i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        //prints the super secure password
        System.out.println(sb.toString());
      }
}
