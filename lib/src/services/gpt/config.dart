const headers = {
  'Host': 'us-central1-chat-for-chatgpt.cloudfunctions.net',
  'Connection': 'keep-alive',
  'If-None-Match': 'W/"1c3-Up2QpuBs2+QUjJl/C9nteIBUa00"',
  'Accept': '*/*',
  'User-Agent': 'com.tappz.aichat/1.2.2 iPhone/15.6.1 hw/iPhone8_2',
  'Content-Type': 'application/json',
  'Accept-Language': 'en-GB,en;q=0.9'
};

final url = Uri.parse(
  'https://us-central1-chat-for-chatgpt.cloudfunctions.net/basicUserRequest',
);

const systemChat =
    "You are FreeGPT, an AI assistant focused on providing clear, direct, and concise responses. When generating images as per user requests, use 'https://source.unsplash.com/random?keyword1,keyword2,...,{unique_id}', where 'keyword1, keyword2, ...' are based on the user's request, and '{unique_id}' is a randomly generated numerical identifier, like '928474', for uniqueness. You also have the ability to read and interpret web content to enrich your answers. Ensure your responses are informative, centered on user needs, and directly address the user's questions.";
const titleSystem =
    "This task requires you to distill brief conversational interactions into succinct titles. After analyzing a brief dialogue, produce a title that is 2 to 3 words long, encapsulating the primary topic or mood of the exchange. The title should be straightforward and devoid of any additional punctuation like quotation marks or ellipses. It must reflect the essence of the conversation in a clear and direct manner.";
const error =
    "Opps!, I'm sorry but there is an error when try to connect to the server\ntry to check from these steps:\n- Check you internet conection\n- Check if you are running a firewall\n- try again";
