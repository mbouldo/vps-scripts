npx create-react-app my-app

npm install -D tailwindcss
>> npx tailwindcss init

npm install @craco/craco --legacy-peer-deps

## create craco.config.js in root

## override index.css with 

@tailwind base;
@tailwind components;
@tailwind utilities;


## replace scripts with:

  "scripts": {
    "start": "craco start",
    "build": "craco build",
    "test": "craco test",
    "eject": "craco eject"
  },

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

npm start
