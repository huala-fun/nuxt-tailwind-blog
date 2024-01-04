import colors from "tailwindcss/colors";
import typography from "@tailwindcss/typography";
import defaultTheme from "tailwindcss/defaultTheme";
export default {
  darkMode: "class",
  plugins: [typography()],
  theme: {
    extend: {
      colors: {
        primary: colors.emerald,
      },
      fontFamily: {
        sans: ["Roboto", ...defaultTheme.fontFamily.sans],
      },
    },
  },
};
