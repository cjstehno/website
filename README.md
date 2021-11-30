# My Web Site

This is the source code for may web landing page.

## Building

To build for release run:

    flutter build web

## Development Running

You can run in development mode with:

    flutter run -d chrome

## Local Running

You can run the local build artifacts using the following, executed in the `build/web` directory:

    python3 -m http.server 8080


## Publish Site

To publish the site, you need to have the production repo checked out. Run the following (after building) to copy the artifacts to the site repository:

    rsync -r build/web/* ../cjstehno.github.com/
    
Then push the changes in the produiction site repo to publish the changes.
