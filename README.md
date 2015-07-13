# docker-ngrok

A [Docker][docker] image for [ngrok][ngrok], introspected tunnels to localhost. The image is built using [gliderlabs/alpine][gliderlabs_alpine] to keep the footprint as small as possible.

The container will tunnel either HTTP or HTTPS traffic by using the `HTTPS_PORT` or `HTTP_PORT` environment variables. Either environment variable can be set using the `-e` flag when running an ngrok container or by using [linked containers](https://docs.docker.com/userguide/dockerlinks/#container-linking), which is shown below.

## Getting the Image

This image is hosted on the Docker index as a trusted build and can be pulled down with:

    docker pull shaynesweeney/ngrok

## Usage

Link the HTTP server container into an ngrok container to expose the server on the internet:

    docker run -d -p 4040 --link <container>:http --name <some-ngrok-name> shaynesweeney/ngrok

To get the `*.ngrok.com` address, check the container's logs:

    docker exec -it <some-ngrok-name> curl localhost:4040/api/tunnels | sed -r 's|.*"public_url":"(http://[^"]+)".*|\1|'

The ngrok web inspection interface is running on port 4040. To get the exposed port:

    docker port <some-ngrok-name> 4040

## Development

* Source host at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested. Ideally create a topic branch for every separate change you make. For example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add support for feature'`)
4. Push to the branch (`git push origin my-new-feature`)

## Authors

Modified and maintained by [Shayne Sweeney][shayne] (<shaynesweeney@me.com>).
Original repo [fnichol/docker-ngrok][https://github.com/fnichol/docker-ngrok].

## License

MIT (see [License.txt][license])

[shayne]:  https://github.com/shayne
[repo]:     https://github.com/shayne/docker-ngrok
[issues]:   https://github.com/shayne/docker-ngrok/issues
[license]:  https://github.com/shayne/docker-ngrok/blob/master/License.txt

[docker]:           https://www.docker.io/
[gliderlabs_alpine]: https://github.com/gliderlabs/alpine
[ngrok]:            https://ngrok.com/
