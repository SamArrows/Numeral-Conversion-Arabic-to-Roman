public class Solution {
    public string IntToRoman(int num) {
        
        return convQuad(num);
    }

    public string mulStr(int x, string y) => x < 1 ? "" : y + mulStr(x-1, y);

    public string convSingle(int x) => x < 4 ? mulStr(x, "I") : (x == 4 ? "IV" : (x < 9 ? "V" + mulStr(x - 5, "I") : "IX"));

    public string convDouble(int x) => x < 40 ? mulStr(x / 10, "X") + convSingle(x % 10) : (x < 50 ? "XL" + convDouble(x % 10) : (x < 90 ? "L" + convDouble(x - 50) : (x < 100 ? "XC" + convDouble(x - 90) : "")));

    public string convTriple(int x) => x < 400 ? mulStr(x / 100, "C") + convDouble(x % 100) : (x < 500 ? "CD" + convTriple(x % 100) : (x < 900 ? "D" + convTriple(x - 500) : (x < 1000 ? "CM" + convTriple (x - 900) : "")));

    public string convQuad(int x) => x < 4000 ? mulStr(x / 1000, "M") + convTriple(x % 1000) : "";

}