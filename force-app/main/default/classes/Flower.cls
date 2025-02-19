public class Flower {
    public string color;
    public Integer height;
    public Integer maxheight;
    public Integer Numberofpetals;

    public static Integer wilt(Integer Numberofpetals){
        if(Numberofpetals >= 1){
        Numberofpetals--;
    }
    return Numberofpetals;
}
    public static void grow(Integer height, Integer maxheight){
        height = height+2;
        if(height >= maxheight){
           Pollinate();
        }
    }
        public static void pollinate(){
            System.debug('pollinating');
        }
    }