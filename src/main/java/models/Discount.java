package models;

public class Discount {
    private int id;                // Cột [id]
    private String discountCode;   // Cột [discount_code]
    private double discountAmount; // Cột [discount_amount]

    // Constructor
    public Discount() {}

    public Discount(int id, String discountCode, double discountAmount) {
        this.id = id;
        this.discountCode = discountCode;
        this.discountAmount = discountAmount;
    }

    // Getter and Setter methods for each property

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDiscountCode() {
        return discountCode;
    }

    public void setDiscountCode(String discountCode) {
        this.discountCode = discountCode;
    }

    public double getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(double discountAmount) {
        this.discountAmount = discountAmount;
    }

    // Optional: Override toString, equals, hashCode if needed
    @Override
    public String toString() {
        return "Discount{" +
               "id=" + id +
               ", discountCode='" + discountCode + '\'' +
               ", discountAmount=" + discountAmount +
               '}';
    }
}
