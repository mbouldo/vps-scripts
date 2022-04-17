## create project folder

```
mkdir my-project
cd my-project
```

```
npx create-react-app client
```

```
mkdir server
```

## client init:
```
npm install axios moment react-file-base64 redux redux-thunk react-redux

npm install -D tailwindcss
npx tailwindcss init
npm install @craco/craco --legacy-peer-deps
```
## Delete & recreate src folder
in root: create
cd src: create index.js, App.js, index.css


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

@layer components {
    .custom-class{
        @apply relative flex items-center justify-center;
    }
}
```

## replace (client) package.json scripts with:

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
## cd client/src (!! SRC folder)
```
mkdir actions
mkdir api
mkdir components
mkdir constants
mkdir assets
mkdir reducers
```



## server init
```
npm init -y
npm install body-parser cors express mongoose nodemon       
```

## package.json in server
```js
  "scripts": {
    "start": "nodemon index.js"
  },
  ```
