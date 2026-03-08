__The Internet__

1. In your own words, what is the _internet_?
    - Simply put, the internet is a network made up of networks.
    - It consists of a physical infrastructure, such as fiber optic cables, routers, hubs, nodes, etc... and protocols which act as rules for the infrastructure to function.

2. How is the _internet_ different from the _World Wide Web_?
    - The internet is the underlying _global network infrastructure_.
    - The World Wide Web is a _service_ that runs on top of the internet, where browsers use protocols to request and display _resources_ (HTML pages, images, etc.) from servers.

3. What does it mean that the internet is a “network of networks”?
    - The internet is made up of many smaller networks (like home networks, office networks, ISP networks) that are all connected together.
    - __Routers__ connect these networks and forward packets between them, so devices on different networks (even in different countries) can communicate.

4. What is a “packet”? Why is data broken into packets instead of sent as one big chunk?
    - A _packet_ is a small, structured unit of data used at the _IP layer_, containing headers (with addresses and control info) and a payload.
    - Data is broken into packets instead of one big chunk to:
        - Make retransmission easier if something is lost,
        - Allow fair sharing of network links among many users,
        - Respect maximum size limits on links,
        - And enable protocols like TCP to manage congestion and flow more effectively.

5. What is the role of __routers__ on the internet?
    - _Routers_ connect different networks and forward packets between them.
    - When a router receives a packet, it looks at the _destination IP address_, uses its _routing table_ to decide the best next hop, and forwards the packet along the path toward its destination.
    - In this way, routers form the backbone of the internet, allowing packets to travel from one local network to another across the world.

6. What is the role of your __home router__ specifically?
    - To encapsulate the packet into a _frame_, send it to a _switch_, which then delivers the data to the receiving device on the LAN or...
    - To decapsulate the frame into a packet and forward it to the WAN to eventually find its way to the destination IP address and recipient.
    - The routers acts a gatekeeper to the home network and connects the LAN to the WAN used by the ISP.

7. Explain the difference between a LAN and a WAN.
    - _LAN (Local Area Network)_ is a network limited to a small geographical area such as a home or office.
    - _WAN (Wide Area Networ)_ spans a larger geographical area connecting multiple _LANs_ together such the network an ISP uses to connect homes and offices to the internet.

8. Define “bandwidth”. What units is it usually measured in?
    - _Bandwidth_ measures the __capacity__ of a network typically measured by bits per second.

9. Define “latency”. What units is it usually measured in?
    - _Latency_ measures __delay__ of a network and is measured by the amount of time it takes for data to get from source to destination, resulting in milliseconds determined by _one way latency_ consisting of:
            1. _Propagation Delay_: Raw travel time of a data unit confined to physics.
                - The kind of infrastructure (copper / fiber optic cables, satellite, or radio) and the distance between devices plays a role.
            2. _Processing Delay_: Processing time occurring at every "hop" performing tasks such as error detection using _checksums_ to ensure data integrity.
                - A _checksum_ is a value provided in the header of a packet (IPv4) or segment (TCP) and an algorithm.
                    - At each "hop" that algorithm is executed and the result compared to the _checksum value_.
            3. _Transmission Delay_: Time taken to push data onto a "link" within the overall network system.
                - Occurs at each stage or "hop".
            4. _Qeueing Delay_: Time data spends in a buffer qeue at each "hop" before it is processed and forwarded.
            * _Round Trip Time (RTT)_ is the time it take from data to be received plus an acknowledgement to be sent back.

10. Give a real-world analogy for bandwidth and latency (e.g., road, pipe).
    - _Latency_ is like the speed limit on a highway while _Bandwidth_ is the amount of lanes.

11. Can you have _high bandwidth_ but _high latency_ at the same time? Give an example scenario.
    - Yes, you can absolutely have high bandwidth and high latency at the same time.
    - Example scenario: Satellite internet
        - Bandwidth: The link can carry a lot of data per second (tens or even hundreds of Mbps), so large downloads can be quite fast once they start.
        - Latency: The signal has to travel from your dish → up to a geostationary satellite → back down to a ground station (and then back again for responses).
            - That’s tens of thousands of kilometers, so the round‑trip time is often 500–600 ms or more.
        - Result: You have “fast pipe, long distance”:
            - Big files download quickly once the transfer is going.
            - But interactive things (online gaming, video calls, SSH, web page clicks) feel sluggish because each request/response takes a long time to complete.

12. Why might an online game feel “laggy” even on a fast broadband connection?
    - Fast broadband usually means _high bandwidth_ (you can download a lot of data per second).
    - Games, however, send/receive small, frequent updates (position, actions, etc.), so they don’t need huge bandwidth.
    - If latency (delay) is high, each update takes too long to travel between your computer and the game server that causes:
        - Delayed responses to your actions
        - Players “teleporting” or rubber-banding
        - Shots or moves registering late
    - Reasons latency can be high even with fast bandwidth:
        - The game server is geographically far away (higher propagation delay).
        - Network congestion on some hop between you and the server (queuing delay).
        - Bad routing or overloaded routers along the path.
        - Wi‑Fi issues at home (interference, contention) adding extra delay.
    - So: high bandwidth helps download big files; low latency is what makes games feel responsive.

13. What is a _communication protocol_? Give two examples of protocols used on the internet.
    - A _communication protocol_ is a set of rules that define __how two or more devices talk to each other over a network__: how messages are formatted, sent, received, and interpreted.
    - Two examples used on the internet:
        - HTTP (HyperText Transfer Protocol) – used between web browsers and web servers for web pages and APIs.
        - TCP (Transmission Control Protocol) – used to provide reliable, ordered delivery of data between applications (e.g., for HTTP, email, file transfer).

14. What problem does IP (Internet Protocol) solve?
    - IP connects devices on different networks by providing IP addresses and a standard packet format that routers use to forward data between networks.
    - Routers use IP addresses described in the `Destination Address` field in the _packet_ header and then calculate the fastest route to the end-point.

15. What problem does TCP solve that IP alone does not?
    - IP is “best effort”: it can drop, reorder, or duplicate packets, with no built‑in recovery.
    - TCP sits on top of IP and adds:
        - Reliable delivery (retransmission of lost packets),
        - Ordered delivery (reassembling packets in the correct order) and No Duplicates (using sequence numbers),
        - Flow control and congestion control.

16. What problem does UDP solve better than TCP in some use cases?
    - User Datagram Protocol is a connectionless protocol using a "fire and forget method".
    - Most practical when retransmission isn't worth it and minimal data loss is acceptable where low-latency/ real-time communication is key.
        - Used in streaming, online gaming and video calls.

17. What is an IP address? Give an example of an IPv4 and an IPv6 address.
    - An IP address is a logical, hierarchical address used to identify devices on a network so routers can deliver packets between different networks.
    - IPv4 uses a 32-bit address split into four 8-bit sections each ranging from 0-255 split by periods (`.`) resulting in 4.3 billion unique addresses.
        - `123.43.234.29`
    - IPv6 uses a 128-bit address split into eight 16-bit sections each ranging from 0-65,500 written using hexadecimals and split by colons (`:`) resulting in 340 undecillion unique addresses.
        - `2001:db8::8a2e:370:7334`

18. What is a _port number_? Why isn’t an IP address alone enough to deliver data to the correct application?
    - An __IP address__ identifies the host device.
    - A __port number__ identifies a specific application/service running on that device.
    - A device can be running many networked applications at the same time and all of them share the same IP address.
    - If data arrived only with an IP address, the OS would have no way of knowing which application should receive it.
    - An example: `203.0.113.5:443`

19. Give three common port numbers and the protocols typically associated with them.
    - `80` -> HTTP (web)
    - `443` -> HTTPS
    - `24` -> SMTP (email)

20. What is DNS? Why do we need it?
    - The __Domain Name System__ is a _distributed database_ that maps human-readable domain names (`google.com`) to machine-readable IP addresses (`197.251.230.45`).
    - DNS is needed because computers use IP addresses to locate servers using the internet, but humans find it easier to remember and use domain names.
    - So DNS acts as a translator, allowing us to use convenient names to access websites without having to remember their numeric IP addresses.

21. Walk through what happens when you type https://example.com  into your browser and press Enter, focusing just on DNS.
    1. Check Cache: The browser checks its own __DNS cache__ and then the __OS cache__ to see if it already has a recent record of the IP address.
    2. DNS Request: If the IP address is not found in the cache the browser sends a __DNS request__ to a __DNS server__ typically provided by the ISP.
    3. Recursive Lookup: If that DNS server doesn't have the IP address, the request is forwarded to other DNS servers up a worldwide hierarchy until a server that holds the authoritative record for that domain is found.
    4. IP Address Returned: The DNS server responds with an IP address for that domain name back down the chain and ultimately to the browser.
    5. Caching the Result: The browser caches this IP address for a certain amount of time (known as a TTL) so that it doesn't have to repeat the DNS lookup for subsequent requests using that domain name.
    * Once the browser has the IP address, it proceeds with establishing a connection to the server and sending as HTTP request.

22. What is the _client-server model_?
    - A network architecture where participants in a data exchange have clearly defined roles.
    - The __client__ is the _initiator_ of the communication.
        - In web interactionss, this is typically the web browser.
    - The __server__ is a program or machine that wait for and responds to requests from clients.
        - It holds __resources__ (like web pages or data) that the client is asking for.
    - This requst/response cycle is the foundation of how almost every interaction with the web works.
    - In contrast with the __peer-to-peer (P2P)__ model where each computer (or node) in a network can act as both a client and a server.

23. Describe the basic sequence of steps in a client-server interaction over HTTP.
    1. The Client Sends an HTTP Request:
        - The client, typically the web browser, initiates communication.
            - It constructs an __HTTP request__ containing:
                - a request line (GET /index.html HTTP/1.1)
                - headers (Host: example.com)
                - an optional body.
        - The request is sent to the server's IP address, which is resolved through DNS.
    2. The Server Processes the Request:
        - The server receives and parses the client's HTTP request.
            - It determines the action required based on the __request method__ and __path__ (e.g., retrieving a specific file or running a program).
    3. The Server Sends an HTTP Response:
        - The server constructs an __HTTP response__ message containing:
            - a status line (HTTP/1.1 200 OK)
            - headers (Content-Type: text/html)
            - a body containing the requested resource (like the HTML of a webpage).
        - The response is sent back to the client.
    4. The Client Receives and Processes the Response:
        - The client receives the response from the server and parses it.
            - The browser renders the HTML and CSS in the response body to display the webpage to the user.

24. Where does HTTP sit in relation to TCP and IP (i.e., which layer)?
    - HTTP is a protocol to be used in the __Application Layer__ used in both the OSI and IP models.
    - It sits at the top-most layer and is responsible for _formatting requests and responses between web clients and servers_.
    - TCP (Transport Layer) provides _reliable, ordered data transfer for HTTP messages_.
    - IP (Internet/Network Layer) handles _the addressing and routing of data packets to the correct destination_.

__TCP & UDP__

25. What is the main purpose of the TCP protocol?
    - To provide _reliable data transfer_ over an inherently unreliable network.

26. Why is TCP called a “reliable” protocol? What does “reliable” mean in this context?
    - TCP is a "reliable" protocol as it provides a _reliable communication channel_ on top of an inherently unreliable network and guarantees:
        1. __Handling Data Loss via Retransmission__:
            - The receiver sends an acknowledgement (ACK) for data it recieves.
            - If the sender doesn't receive an ACK within a certain time, it assumes the data segment was lost and retransmits it.
        2. __In-Order Delivery__:
            - Each segment has a _sequence number_.
            - Even if network conditions cause segments to arrive out of order, the receiver can use the sequence numbers to reassemble them into the correct sequence before passing the data to the application.
        3. __Error Detection__:
            - Every segment includes a _checksum_.
            - The receiver calculates its own checksum on the received data and if it does not match the checksum in the header, the segment is considered corrupt and discarded.
            - This triggers a retransmission.
        4. __Handling Duplication__:
            - The _sequence numbers_ also allow the receiver to identify and discard any duplicate segments that may have been sent due to network issues.

27. What does it mean that TCP provides “ordered” delivery?
    - Segments contain a _sequence number_ in the header which helps assemble data when segments arrive out of order due to network issues.
    - The OS can assemble the data using those sequence numbers and pass the data then to the right application.

28. What is a TCP segment?
    - A ​TCP _segment_​ is the _Protocol Data Unit (PDU)_ for the TCP protocol at the _Transport Layer_.
    - Like other PDUs, it is a block of data that consists of two main parts:
        1.  ​Header:​ This contains control information that TCP uses to do its job. Key fields in the header include:
            - the __source and destination port numbers__ (for multiplexing),
            - __sequence and acknowledgement numbers__ (for reliability and ordered delivery),
            - and a __checksum__ (for error detection).
        2.  ​Payload:​ This contains the actual data from the _Application Layer_ that needs to be transmitted.
            - For example, the payload could be a portion of an HTTP request or an HTML file.
                - The process of wrapping the Application Layer data in a TCP header is a key part of ​data encapsulation​.

29. What is a UDP datagram?
    - A ​UDP _datagram_​ is the _Protocol Data Unit (PDU)_ for the User Datagram Protocol at the _Transport Layer_.
    - It consists of a data payload from the Application Layer encapsulated with a very simple header.
        - The key characteristic of the UDP datagram is its minimal header, which contains only four fields:
            1.  ​Source Port​
            2.  ​Destination Port​
            3.  ​Length​ (of the datagram)
            4.  ​Checksum​ (for error detection, and it's optional).
        - This simple structure is why UDP is lightweight and fast.
            - The header provides the bare minimum needed for _multiplexing_ (directing data to the correct application via port numbers) but lacks the fields for sequencing or acknowledgements that TCP uses for reliability and ordered delivery.

30. List three key differences between TCP and UDP.
    1.  ​Reliability vs. Unreliability:
        • ​TCP​ is a _reliable protocol_. It guarantees that data will be delivered completely, without errors, and in the correct order. It achieves this through mechanisms like message acknowledgements, retransmission of lost segments, and sequence numbers.
        • ​UDP​ is an _unreliable protocol_. It provides no guarantee of message delivery or delivery order. It operates on a "best-effort" basis, which is why it's sometimes described as "fire and forget."
    2.  ​Connection-Oriented vs. Connectionless:
        •TCP​ is _connection-oriented_.
            - Before any data is sent, TCP establishes a connection between the sender and receiver using a process called a "three-way handshake." This setup introduces some initial latency though.
        • UDP​ is _connectionless_.
            - Applications can start sending data immediately without establishing a formal connection. This lack of a handshake contributes to its speed and lower latency.
    3.  ​Complexity and Overhead vs. Simplicity and Speed:
        • TCP​ is a complex protocol with a _larger header_ to manage reliability, flow control, and congestion avoidance.
            - This complexity adds overhead but provides robust communication.
        • UDP​ is a very simple protocol with a _minimal header_.
            - This simplicity means less overhead, which makes it faster.
            - The lack of in-order delivery also avoids potential "Head-of-line blocking" at the Transport Layer.

31. Give an example of an application that commonly uses TCP and explain why it uses TCP.
    - An email application for example would use TCP as it requires the reliability that the protocol provides as no data can be missing or in the wrong order in an email.
    - The slight overhead and latency introduced by TCP's connection setup and reliability checks are an acceptable trade-off to ensure the message arrives intact.

32. Give an example of an application that commonly uses UDP and explain why it uses UDP.
    - A video call or online gaming application would use UDP as speed is of the essence with a tolerance for lost data.
    - The low latency is a must.

33. What does it mean that UDP is “connectionless”?
    - That no connection was established with the server before the client started sending messages (no handshake).
        - As a result of this, the sender doesn't track which diagrams have been sent, been received, or in what order, it simply just fires and forgets.

34. What does it mean that TCP is “connection-oriented”?
    - For a protocol to be ​"connection-oriented,"​ it means that a formal connection or session must be established between the two communicating devices ​before​ any application data can be exchanged.
    - In TCP, this is accomplished through a ​_three-way handshake_ process​:
        1. The client sends a `SYN` (synchronize) segment to the server to initiate a connection.
        2. The server responds with a `SYN/ACK` (synchronize/acknowledge) segment.
        3. The client replies with an `ACK` (acknowledge) segment, which establishes the connection.
    - Only after this three-step process is complete can the client begin sending application data.
    - This established connection is "stateful," meaning both the client and server maintain information about the connection's state (e.g., sequence numbers, acknowledgements).
        - This state is what allows TCP to provide its reliability features, like retransmitting lost packets and ensuring in-order delivery.

35. What is the purpose of the `SYN` and `ACK` flags in TCP?
    __Purpose of the SYN Flag__:
        - The `SYN` (Synchronize) flag is used to _initiate a new TCP connection_ and _to synchronize the sequence numbers_ between the two communicating devices.
        - When a device wants to establish a connection, it sends a TCP segment with the `SYN` flag set to 1.
            - This segment effectively acts as a connection request.
            - A key part of this process is that this initial `SYN` segment also contains the starting sequence number that the sender will use for its data transmission.
            - This synchronization of sequence numbers is a foundational step for ensuring _reliable, ordered data delivery_.
    __Purpose of the ACK Flag__
        - The `ACK` (Acknowledgement) flag is used to acknowledge the successful receipt of a TCP segment.
        - Its purpose is to confirm to the sender that a segment (or a stream of segments) has arrived. When the `ACK` flag is set to 1, it indicates that the Acknowledgement Number field in the TCP header is valid.
        - This number tells the sender the sequence number of the next byte of data it expects to receive.
    - During the three-way handshake:
        1.  The server responds to an initial `SYN` with a segment that has both `SYN` and `ACK` flags set.
            - The `ACK` here acknowledges the client's connection request.
        2.  The client completes the handshake by sending a final segment with the `ACK` flag set, acknowledging the server's response.
    - Throughout the life of the connection, the `ACK` flag is used continuously to confirm receipt of data, which is the core mechanism for TCP's reliability.

36. Conceptually, what are __flow control__ and __congestion control__ trying to prevent?
    - __Flow control__ is trying to prevent the sender from overwhelming the _receiver_.
        - A mechanism to _manage the speed of data transfer directly between two endpoints of a connection_.
        - If data is sent faster than the recipient can process, it is stored in a _buffer qeue_.
            - If that buffer overflows though, the data is lost.
        - The `WINDOW` field in the TCP header allows the recipient to tell the the sender how much buffer space is available.
            - If the buffer is getting full, the recipient signals to the sender to slow down.
    - __Congestion control__ is trying to prevent that sender from overwhling the _underlying network_.
        - About the capacity of _routers and links_ that make up the network between the sender and receiver.
        - If too much data is sent into the network at once, the buffers of the network routers overflow and data segments are lost.
        - TCP interprets segment loss as a sign of _network congestion_ because it has to retransmit them, it assumes the network is "gridlocked" and deliberately reduces the transmission rate to ease the load on the network.

37. Why is _flow control_ necessary? Give an example of a problem that occurs without it.
    - __Flow control__ is necessary mechanism because a receiving device can only process so much information.
        - When it becomes overwhelmend, segments are placed in a _buffer qeue_ to be processed.
            - If that buffer overflows, the segments are dropped and must be re-transmitted making the transfer highly inefficient.
    - An example of this is sending a large file to an old computer.
        - The buffer quickly fills up so subsequent segments are dropped because there is no place to store them.
        - The computer signals to the fast server to slow down by adjusting the WINDOW size.

38. What is _congestion control or congestion avoidance_?
    - __Congestion control__ is a mechanism that prevents the sender from overwhelming the _underlying network_, transmitting more data on the network than the network's capacity (i.e., its routers and links) can handle.
    - Similar to preventing a traffic gridlock on a network road.

39. Why is _congestion control_ important for the health of the entire network?
    - Congestion control is critical for the entire network because network resources, such as _routers_, are shared by many different connections.
    - If one sender sends too much data, a router's buffer is quickly filled up and the router is forced to drop packets, not just for _one sender_, but for any _other connections_ passing through it.
        - If this happens to many connections at once, it leads to __congestion collapse__, where the network is saturated with retransmitted packets, grinding effective communication to a halt for all users.
    - Congestion control acts as a __"good citizen" mechanism__, where each TCP connection is mindful of the shared network's health and slows down when it detects stress.

40. At a high level, how does TCP respond when it detects packet loss due to congestion?
    - TCP uses packet loss as a _feedback signal_ to detect __network congestion__.
    - In response, it deliberately _reduces the size of its transmission window_, slowing down _transmission rate_, easing the load on the network's routers.

__URLs__

41. What does URL stand for?
    - Uniform Resource Locator

42. What is the purpose of a URL?
    - To specify the location of a resource on the internet, much like a house address allows you to find a person's home.
    - _It tells the client where a resource is and how to access it_.

43. Break down this URL into its components:
`https://blog.example.com:8080/articles/10?sort=asc&page=2#comments`
    - Scheme:`https`
        - Tells the web client what protocol to use to access the resource.
    - Host: `blog.example.come`
        - Tells the client where the resource is located or hosted.
    - Port: `8080`
        - Specifies the communication endpoint on the server.
        - Only required if the server is not using a default port for the scheme (`443` for HTTPS, `80` for HTTP)
    - Path: `/articles/10`
        - Identifies the specific local resource being requested on that server.
    - Query string: `sort=asc&page=2`
        - Used to send additional data to the server.
        - Made of key-value pairs and identified by the `?`.
    - Fragment: `comments`
        - Identified by the `#` and is a part of the URL that points to a specific section within the resource itself.
        - Handled by the browser and not the server itself.

44. What is the difference between a URL’s scheme and its host?
    - The _scheme_ tells the client __how__ to access a resource by specifying the protocol to use (e.g., `http`, `https`, `ftp`, `smtp`, etc..).
    - The _host_ tells the client __where__ the resource is located (e.g., `launschool.com`).

45. Which part of a URL is typically resolved by DNS?
    - The _host_ (or _hostname_) is the part of the URL that is resolved by the Domain Name System (DNS) to find the server's corresponding _IP address_.

46. What is a query string? Where is it located in a URL?
    - The _qeuery string_ is used to pass additional data to the server as part of an __HTTP request__.
    - It is located at the end of the URL and begins with a `?`.

47. How are multiple query parameters separated?
    - By an _ampersand_ (`&`).

48. Given the URL `/search?q=python&limit=10`, identify the keys and values in the query string.
    - key: `q`, value: `python`.
    - key: `limit`, value: `10`.

49. What is the default port for HTTP? For HTTPS?
    - HTTP -> `80`.
    - HTTPS -> `443`.

50. Construct a valid URL for:
- Accessing a `user` profile with id `42` over HTTPS on `example.com`.
    - `https://example.com/users/42`
- Sending a search query "network protocols" on `example.com` using a `/search` path.
    - `http://example.com/search?q=network+protocols`
        - Note the `+` used to encode a space.

51. What is URL encoding (percent-encoding)?
    - _URL encoding_ is a technique where certain characters in a URL are replaced with a `%` symbol followed by two hexadecimal digits that represent the character's ASCII value.
    - It is necessary because some characters have special meaning in URLs (e.g., `?`, `&`, `#`) and would break the URL's structure if used directly in a _path_ or _query parameter_.
        - Also used for characters that have no corresponding character in the standard ASCII set.

52. Give an example of a string that needs to be URL-encoded, and show the encoded form.
    - Original string: `hello world`.
    - Encoded form: `hello%20world`

53. What character is often used instead of `%20` inside HTML form query strings?
    - The `+` is often used to represent a space.

54. In which parts of a URL is encoding most commonly required?
    - Most commonly used in the _path_ and _qeuery string_, as these parts often contain arbitrary text or user-submitted data that might include special characters.

__HTTP and the Request/Response Cycle__

55. What does HTTP stand for?
    - HyperText Transfer Protocol.
56. At a high level, what is the role of HTTP in web communication?
    - HTTP is an _application protocol_ that defines a set of rules for __how__ web clients (like browsers) and web servers communicate with each other.
    - Its primary role is to structure this communication as a __​request-response protocol​__.

57. What is an _HTTP request_?
    - A message sent by a __client__ (like a web browser) to a __server__.
    - It follows a standard format and is used to ask the server to perform an action or retrieve a _resource_, such as an HTML file or an image.

58. What is an _HTTP response_?
    - A message sent by a __server__ back to the __client_ as a response to a request.
    - It contains the _resource_ the client asked for and a _status message_ indicating the outcome of the request.

59. Describe the basic structure of an HTTP request message.
    - __Request line__:
        - The first line of the request specifying:
            - The _HTTP method_ (e.g., GET, POST) which is the action the client wants to perform.
            - The _path_ to the resource on the server (/index.html)
            - The _HTTP version_ being used (HTTP/1.1)
    - __Headers__:
        - A series of colon-seperated name-value pairs that provide additional information about the request, commonly including:
            - Host (The domain name of the server)
            - User-agent (a string identifying the client)
            - Accept-Language (The language the client can understand.)
    - __Body__(optional):
        - Used to send data to the server.
        - For example, when submitting a form with a POST request.
        - For GET requests, the body is typically empty.

60. Describe the basic structure of an HTTP response message.
    - __Status line__:
        - The first line in the response that includes:
            - The _HTTP version__ (HTTP/1.1)
            - A _status code_ (e.g., 200, 404), which is a three-digit number indicating the result of the request.
            - A _reason phrase_ (e.g., OK, Not Found), which is a short description of the status code.
    - __Headers__:
        - Similar to request headers, these are name-value pairs that provide more information about the response which commonly include:
            - Content-Type (what kind of data is in the body)
            - Content-Length (The size of the body)
    - __Body__ (optional but usually present):
        - Contains the actual resource or data requested by the client such as the HTML for a webpage or the data for an image.

61. What is the purpose of the _Host header_ in an HTTP request?
    - In an HTTP Request, the Host header is used to specify the _domain name_ of the server the client is trying to communicate with.
    - Important because a single server with on IP address can host _multiple websites_.

62. What is the purpose of the _Content-Type header_? Give two examples of values for it.
    - Indicates the media type (or format) of the resource being sent in the message body.
    - Used in both requests and responses and tells recipient how to interpret the data in the body.
    - 2 examples:
        1. `text/html; charset=utf-8`
            - indicates the body contains an HTML document.
        2. `application/json`
            - indicates body contains data formatted as JSON (common in web APIs)

63. What type of information might be found in HTTP request headers? Give three examples.
    - HTTP request headers provide additional information about the client and the resource to be fetched.
        - This metadata helps the server understand the client's capabilities and the context of the request.
    - 3 examples:
        1. `User-Agent`: A string that identifies the client software such as the browser and OS being used.
            - `Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5)`
        2. `Accept-Language`: A list of languages that the client can understand, which the server can use to send back a response in the user's preferred language.
            - `en-US, en;q=0.8`
        3. `Connection`: The type of communication the client would prefer, such as `keep-alive`, which suggests keeping the connection open for multiple requests.

64. What type of information might be found in HTTP response headers? Give three examples.
    - HTTP response headers provide additional meta-information about the response and the resource being sent back from the server.
        - This helps the client understand how to process the response.
    - 3 examples:
        - `Server`: Name of the server software that generated the response.
            - `Server: thin 1.5.0 codename Knife`
        - `Content-Type`: Media type of the data in the response body, which tells the client how to interpret it.
            - `Content-Type: text/html; charset=UTF-8`
        - `Location`: Used in redirection responses (301/302 status code) to tell the client the new URL for the resource.
            - `Location: https://www.github.com/login`

65. In an HTTP request, where is the HTTP method found?
    - The HTTP method is found in the __request line__, the first lone of an _HTTP request_.
        - `GET /index.html HTTP/1.1`

66. Name at least four common HTTP methods (verbs).
    - `GET`: To request and retrieve a resource from a server.
    - `POST`: Used to submit data toa. server to create/update a resource.
    - `PUT`: To update an existing resource completely.
    - `DELETE`: Used to remove a resource.

67. What is the difference between the _request line_ and the _status line_?
    - The __request line__ is the first line of an __HTTP request__ (sent from client to server) whereas the __status line__ is the first line of an __HTTP response__ (sent from server to client).
    - The __request line__ asks the server to perform an action.
        - It contains the HTTP method, the path to the resource, and the HTTP version (GET /articles HTTP 1.1).
    - The __status line__ reports the result of the request.
        - It contains the HTTP version, a numerical status code and a text-based reason phrase (`HTTP/1.1 200 OK`).

68. Describe the full HTTP request/response cycle and all the layers and protocols used starting from when a user enters a URL into a browser.
Include DNS resolution.
Include TCP connection.
Include sending and receiving HTTP messages.

1. Application Layer: Initiates the Request.
    - When a URL is typed into the search bar, the browser, as a client application, needs to fetch the _resource_ at that URL.
    - _DNS Resolution_ is the act of looking up the IP address to connect with a domain name.
        - A _DNS lookup_ performs:
            1. The browser checks its own cache, then the OS's cache for recent lookups.
            2. If the IP address is not found in a cache, the browser sends a request to a _DNS resolver_.
                - The resolver finds the correct IP address and returns it to the browser which then stores it in the cache.
2. Transport Layer: Establishing a Connection
    - Before the browser can send its request for the webpage, it must establish a reliable, two-way communication channel with the server using TCP.
        - The TCP Three-Way Handshake:
            1. `SYN`: browser send the synchronize flag set to the server's IP address, requesting to open a connection.
            2. `SYN/ACK`: server receives the SYN and sends back a segment with both SYN and ACK (acknowledge) flags.
                - This acknowedges the client's request and asks to establish a connection in the other direction.
            3. `ACK`: browser receives the SYN/ACK and sends back a final ACK segment back to the server, establishing a stable connection.
3. Application Layer: Sending the HTTP Request
    - Now that the connection is open, the browser sends an HTTP request (a plain-text message formatted according to HTTP protocol).
        - Request Line: `GET /books HTTP/1.1`
        - Headers: `Host: launchschool.com, User-Agent: Mozilla`, etc...
        - Body: (empty for `GET` requests)
4. Journey Across the Network (All Layers):
    1. Transport Layer (TCP): Request is broken into smaller chunks called _segments_. Each segment gets a header with source/destination port numbers and sequence numbers.
    2. Network Layer (IP): Each segment is encapsulated into an IP _packet_ containing source and destination IP addresses in the header.
    3. Link Layer (Ethernet): Each packet is placed into a _frame_ which includes MAC addresses for the next hop in the local network (like your home router).
        - _Frames_ are converted into electric signals, radio waves or light pulses and sent over a physical medium (e.g., Ethernet cables, Fiberoptic, wifi, etc...)
            - This data travels across the internet, from router to router until it reaches the destination server.
5. Server-Side: Processing and Responding
    - Receiving the request: The server receives the data and passes it up its own network stack, reassembling the original HTTP request message.
    - Server Processing (Application Layer): The web server software reads the HTTP request (e.g., Nginx, Apache..).
        - It sees the `GET` request for the resource at `/books` and processes it, which might involve retreiving an HTML file from its disk or running a program to generate the content.
    - HTTP Response (Application Layer): The server constructs an __HTTP response__ including a _status line_ (`HTTP/1.1 200 OK`), _headers_ (`Content-Type: text/html, Content-Lenght: [size of body],..`), and a _body_ (The actual HTML contents)
6. The Journey Back (All Layers)
    - The HTTP response travels back to the client, going down the server's network stack an up the client's.
7. Application Layer: Rendering the Page
    - Browser receives the HTTP response and parse it. `200 OK` status code confirms successful retrieval.
        - Rendering: The browser's rendering engine starts processing the HTML in the _response body_.
        - Fetching Additional Resources: As the browser parses the HTML, it will discover other resources needed to display the page (e.g., CSS, JavaScript files, and images).
            - For each resource, a new HTTP request/response cycle is initiated, often reusuing the exising TCP connection for efficiency (called a "persistant connection" or HTTP keep-alive)
    - Final Display: Once all the resources are fetched and processed, the browser assembles a complete viewable webpage.

69. What is a status code in HTTP? Where does it appear in the response?
    - An __HTTP status code__ is a three-digit number that a server sends back in a response to signify the status of a client's request.
        - It appears in the very first line of an HTTP response, called __the status line__, alongside the __HTTP version__ and __descriptive reason phrase__.
            - `HTTP/1.1 200 OK`

70. What does a `2xx` status code category represent? Give two specific examples and their meanings.
    - Indicates client's request was successfully received, understood and accepted, signifying success.
    - `200 OK`: Most common success code.
        - The request was handled successfully and the requested resource is being sent back in the _response body_.
    - `201 Created`: Appears when working with APIs.
        - Indicates that the request was successful and resulted in the creation of a new resource on the server.

71. What does a `3xx` status code category represent? Give two specific examples and their meanings.
    - Indicates redirection.
    - The server is telling the client that it needs to take additional action, usually by making a new request to a different URL, to complete the request.
    - `301 Moved Permanently`: The requested resource has been permanently moved to a new URL, provided in the `Location` header of the response.
    - `302 Found`: The requested resource has been temporarily moved to a different URL.

72. What does a `4xx` status code category represent? Give two specific examples and their meanings.
    - Indicates _client-side error_ meaning the server thinks the client made a mistake, such as requesting a resource that does not exist or a malformed request.
    - `404 Not Found`: Most common client-side error.
        - The server could not find the resource that the client requested.
    - `400 Bad Request`: The server could not understand the request due to invalid syntax.

73. What does a `5xx` status code category represent? Give two specific examples and their meanings.
    - Indicates _server-side error_.
    - The request was valid, but the server encountered and unexpected condition that prevented it from fulfilling the request. (Outside of the client's control.)
    - `500 Internal Server Error`: A generic "catch-all" error.
        - The server encountered an error and couldn't be more specific about the problem.
    - `503 Service Unavailable`: The server is not ready to handle the request, often because its down for maintenance or overloaded.

74. Why can statelessness be a problem for web applications that need to remember users or their actions?
    - Modern web applications are expected to provide a continuous, stateful experience, but the protocol they are built on, HTTP, is inherently _stateless_.
        - Each request/response cycle is independent of the previous one.
            - In the context of HTTP, this means the server does not hold on to any data about the client between requests.
        - For example:
            1. Shopping Carts: An item is added to your cart (one request) and then you navigate to another page to continue shopping (second request).
                - In a stateless world, the server would have no memory of the first request and the shopping cart would be empty after the second request.
            2. User Logins: You login to a website with a username and password (one request). When you click to view your profile (second request), the server would have forgotten that you just logged in and ask you for your credentials again.

75. Explain how cookies are used to simulate state in HTTP:
    - Cookies are the primary client-side mechanism for simulating state.
        - Since HTTP is stateless, a server normally has no way to link multiple requests from the same client.
        - Cookies solve this by acting as a small piece of memory that the browser can hold on to.
    - The server gives the browser a unique piece of data (the cookie) and the browser sends that piece of data back to the server with every subsequent request.
        - This allows the server to identify the client across multiple independent requests, creating the illusion of a continuous, stateful session.

76. How does the server send a cookie to the client?
    - Using the `Set-Cookie` header with a _session id_ in an HTTP response.
    - The browser stores the value of the cookie and associates it with the server's domain.

77. How does the client send it back on future requests?
    - After the cookie has been set, the browser automatically includes it in the `Cookie` header of every subsequent HTTP request to that server.
        - The server reads this header to identify the client.

78. What is a __session__ in the context of web applications?
    - A __session__ refers to the data that the _server_ stores to keep track of the specific user's state.
    - While the _cookie_ is stored on the _client-side_ (the browser), the actual _session data_ (user ID, shopping cart contents, login status, preferences, etc..) is stored on the server.
    - The server uses a unique _session id_ to link a client to their session data on the server.

79. How do cookies and server-side sessions work together to simulate state?
    - The _cookie_, stored on the client simply holds the _session id_ while the _session_ on the server holds the actual _session data_.

80. Besides cookies, name one other mechanism for maintaining state or user data in a browser.
    - AJAX (Asynchronous JavaScript and XML) allows a webpage to send requests and receive responses from a server in the background, __without reloading the entire page__.
        - This enables the _client_ to fetch or update small pieces of data, making the application feel more dynamic and responsive, a key part of simulating a stateful experience.

81. Explain the difference between GET and POST requests in terms of:
    - `GET` is used to request and retrieve data from a server.
        - Meant for _read-only operations_.
    - `POST` is used to submit data to a server to create or update a resource.

82. Where data is typically placed:
    - In a `GET` request, data is appended to the URL as a _qeuery string_ (`?search=dogs`).
    - In a `POST` request, data is sent in the _body_ of the HTTP request, which is not visible in the URL.

83. Whether they are meant to be safe/idempotent:
    - `GET` requests should be "safe", meaning they should have no side effects or change the state of the server.
        - They should also be _idempotent_, meaning making the same request multiple times has the same effect as making it once.
    - `POST` requests are neither safe nor idempotent, so making the same `POST` request multiple times likely results in the creation of multiple new resources.

84. Give an example of an operation that should use GET:
    - Requesting the results for a search qeuery.
        - The search itself doesn't change any data on the server; it only retrieves it.

85. Give an example of an operation that should use POST:
    - Submitting a form to create a new user account or logging into a website.
        - These actions change the server's state or involve sending sensitive information like a password.

86. Why is it a bad idea to use GET for actions that change server state (like deleting a resource)?
    1. Safety: It violates the principle that `GET` requests should be safe and not cause side effects.
    2. Security: Sensitive data would be exposed directly in the URL, which is logged in the browser history, server logs, and network caches.

87. Conceptually, what does AJAX allow you to do that plain form submissions do not?
    - AJAX allows a web browser to send an HTTP request to a server and update just a ​​part​​ of a webpage with the response, all without requiring a full page reload.
    - Plain form submissions, by contrast, always cause the browser to navigate to a new page or reload the current one entirely.

88. What does it mean that AJAX requests are “asynchronous”?
    - "Asynchronous" means that when an AJAX request is sent, the browser doesn't stop or freeze while waiting for the server to respond.
        - The request happens in the background. The user can continue to interact with the rest of the page, and when the response eventually arrives, a "callback" function is triggered to process the response and update the page.

89. Give an example of a user interface feature that would likely use AJAX.
    - A search bar with auto-complete suggestions. As you type each letter, an AJAX request is sent to the server with your partial query. The server responds with a list of suggestions, which are then used to update a dropdown list below the search bar, all without reloading the page.

90. How does using AJAX change the user experience compared to full page reloads?
    - AJAX makes web applications feel much faster, smoother, and more responsive, similar to a desktop application. Since only small portions of the page are updated, the user doesn't experience the jarring "flash" of a full page reload for every small interaction. This creates a more seamless and continuous user experience.

Security

91. What are some security risks associated with plain HTTP (without TLS)?
    1. __Eavesdropping (Packet Sniffing)__: Attackers on the same network can read the data being sent back and forth, including sensitive information like passwords or session IDs seen in plain text.
    2. __Man-In-The-Middle (MitM) Attacks__: An attacker can intercept and alter communication between the client and server whithout either party knowing.

92. How does HTTPS protect against eavesdropping and MitM attacks?
    - HTTPS (Secure HTTP) encrypts every request and response before it is sent over the network using the TLS protocol (Transport Layer Security).
    - TLS ensures:
        1. _Authentication_: verifying the identity of the server through certificates and CAs.
        2. _Encryption_: Even if an attacker eavedrops, the information captured is encrypted and useless to them.
        3. _Integrity_: Using a Message Authentication Code (MAC), to detect data tampering.

93. What is Cross-Site Scripting (XSS)?
    - Cross-Site Scripting (XSS) is a type of attack that happens when an application allows users to input code that is then displayed directly on the site without being properly handled.
    - This malicious code then executes in the browsers of other users who view the page.

94. Describe a simple example of how an XSS attack might be carried out on a web application.
    - Imagine a public comment section on a website.
    - An attacker submits a malicious scipt and the website stores that comment in its database.
    - Later, users visit the page to read the comments, the browser renders attacker's comment running the malicious code in the users browser.

95. What is one way to prevent or reduce the risk of XSS?
    - One of the most effective ways is to ​escape​ all user-provided data before displaying it on a page.
    - _Escaping_ converts special HTML characters (like < and >) into their HTML entity equivalents (< and >). This causes the browser to display the characters as plain text instead of interpreting them as code, neutralizing the malicious script.

96. What is session hijacking?
    - _Session hijacking_ is an attack where an attacker gets a hold of a user's valid session ID. With this ID, the attacker can impersonate the user and gain access to their account and data without needing their username or password.

97. How can an attacker hijack a user’s session?
    - By stealing the _session ID_ via packet sniffing on an unencrypted (HTTP) network to read the session cookie as it is transmitted between client and server.

98. Name two ways to protect cookies that hold session IDs.
    1. Use HTTPS across the entire application:
        - This encrypts all traffic including cookie headers, making eavesdropping impossible.
    2. Set an expiration time on sessions:
        - Sessions that dont expire give hackers infinite amounts of time to use a stolen ID.
        - Expiring sessions after a period of inactivity (e.g., 30 min) narrows the window of opportunity for an attacker.

99. Why is it important that session cookies are not accessible to client-side JavaScript in many cases?
    - If an attacker successfully injected malicious script onto a page (XSS), that script could potentially accrss the browser's cookies and steal the _session id_.
    - By making the session cookie inaccessible to JavaScript (using the `HTTPOnly` flag), this is prevented.
        - Even if the XSS vulnerability exists, the attacker's script won't be able to read and steal the session cookie.

100. What is the purpose of the `Secure` flag on cookies?
    - The `Secure` flag instructs the browser to only send the cookie back to the server over an encrypted HTTPS connection. It prevents the cookie from being transmitted over an insecure HTTP connection, which would make it vulnerable to eavesdropping.

101. What is the purpose of the `HttpOnly` flag on cookies?
    - The `HttpOnly` flag prevents a cookie from being accessed by client-side JavaScript. This is a crucial security measure to mitigate Cross-Site Scripting (XSS) attacks. If an attacker manages to inject malicious JavaScript onto a page, this flag prevents that script from stealing the user's session cookie.

102. What is TLS and how does it relate to HTTPS?
    - TLS (Transport Layer Security) is a cryptographic protocol designed to provide secure communication over a computer network. HTTPS (HTTP Secure) is not a separate protocol; it is simply the standard HTTP protocol layered on top of TLS. When you use HTTPS, your HTTP requests and responses are encrypted by TLS before being sent across the network.

103. What three main security services does TLS provide?
    1.  ​Encryption​: A process of encrypting a message so that it can only be read by those with an authorized means of decrypting it.
    2.  ​Authentication​: A process to verify the identity of a particular party in the message exchange.
    3.  ​Integrity​: A process to detect whether a message has been interfered with or faked during transit.

104. How does TLS provide confidentiality?
    - TLS provides confidentiality through ​_encryption_​.
    - During the initial "TLS Handshake," the client and server securely agree upon a shared secret key. All subsequent communication is then encrypted using this key, making the data unreadable to anyone who might intercept it.
        - _​Asymmetric encryption_​ (public/private keys) is used at the beginning, during the TLS Handshake.
            - It's relatively slow, but it allows the client and server to securely exchange a secret key without having ever met before.
            - The public key is used to encrypt the message, the private key to encrypt the message.
        - ​_Symmetric encryption​_ (a single shared secret key) is used for encrypting all the actual application data after the handshake is complete.
            - It is much faster and more efficient than asymmetric encryption, making it ideal for encrypting the bulk of the communication
105. How does TLS provide integrity?
    - TLS provides integrity through the use of a ​Message Authentication Code (MAC)​.
    - A MAC is a short piece of information generated from the message content and a secret key. It's sent along with the message.
        - The receiver can regenerate the MAC using the same process and verify that it matches the one sent by the sender.
    - If they don't match, it means the message was altered in transit.

106. What is a digital certificate in the context of TLS?
    - A digital certificate is an electronic document that proves the ownership of a public key. It binds together a public key with an identity (like a domain name, e.g., www.launchschool.com) and is signed by a trusted Certificate Authority.
    - It's the primary way a client can be sure that the public key it receives actually belongs to the server it's trying to connect to.

107. What role do Certificate Authorities (CAs) play in TLS?
    - Certificate Authorities (CAs) are trusted entities that verify the identity of organizations or individuals and issue digital certificates for them.
    - Your browser and operating system come with a pre-installed list of trusted "Root CAs." When your browser receives a certificate from a server, it checks if it was signed by a CA that it trusts, creating a "chain of trust."
    -  CAs are the foundation of the authentication process in TLS.

108. Why is simply encrypting data not enough without authentication?
    - Encrypting data without authentication is dangerous because you might be having a perfectly secure, encrypted conversation with an attacker.
    - Without authentication, you have no way to verify ​who​ is on the other end of the connection.
        - An attacker could perform a man-in-the-middle (MitM) attack, impersonating the real server.
            - They would establish an encrypted connection with you, and you would send your sensitive data (like passwords or credit card numbers) to them, thinking it was safe.
    - Authentication ensures you are encrypting your data for the correct, legitimate server.