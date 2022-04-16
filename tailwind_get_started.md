> npx create-react-app my-app

> npm install -D tailwindcss
> npx tailwindcss init

> npm install @craco/craco --legacy-peer-deps

## create craco.config.js in root
```
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

@tailwind base;
@tailwind components;
@tailwind utilities;


## replace package.json scripts with:
```
  "scripts": {
    "start": "craco start",
    "build": "craco build",
    "test": "craco test",
    "eject": "craco eject"
  },
```

> npm start
