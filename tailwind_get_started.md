```npx create-react-app my-app
```
``` npm install -D tailwindcss
```
``` npx tailwindcss init
```
``` npm install @craco/craco --legacy-peer-deps
```

## create craco.config.js in root

```js
module.exports = {
    style: {
        postcssOptions: {
            plugins: [
                require('tailwindcss'),
                require('autoprefixer'),
            ]
        }
    }
}
```



## override index.css with 
```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

## replace package.json scripts with:

```js
  "scripts": {
    "start": "craco start",
    "build": "craco build",
    "test": "craco test",
    "eject": "craco eject"
  },
```

## in your tailwind.config.js

```js
module.exports = {
  mode: 'jit',
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}

```

```npm start
```



