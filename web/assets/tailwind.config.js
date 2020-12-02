module.exports = {
  purge: {
    mode: 'all',
    content: [
      './*.html',
    ],
  },
  future: {
    removeDeprecatedGapUtilities: true
  },
  theme: {
    extend: {
      fontFamily: {
        sans: [
          'Raleway',
          'system-ui',
          '-apple-system',
          'BlinkMacSystemFont',
          '"Segoe UI"',
          'Roboto',
          '"Helvetica Neue"',
          'Arial',
          '"Noto Sans"',
          'sans-serif',
          '"Apple Color Emoji"',
          '"Segoe UI Emoji"',
          '"Segoe UI Symbol"',
          '"Noto Color Emoji"',
        ],
        hand: [
          '"Mr Dafoe"',
        ],
      },
      colors: {
          'clf-africa': {
            '100': '#f2ecdf',
            '400': '#d2b874',
            '500': '#746743',
            '700': '#3a3321',
            '900': '#36241c',
          }
      },
      screens: {
        xxl: '1410px',
      },
    },
  },
  variants: {
    borderWidth: ['responsive', 'hover'],
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
  ],
};
