
const API = {
  GetChatbotResponse: async message => {
    return new Promise(function(resolve, reject) {
      setTimeout(function() {
        if (message === "hi") {
          resolve("Hi!")
        }
        else {
          let data = {"text": message};
          fetch(`${process.env.SERVER_URL}/connector/webhook`, {
            method: "POST",
            headers: {'Content-Type': 'application/json'}, 
            body: JSON.stringify(data)
          }).then(res => {
            data = res.text();
            resolve(data)
          }); 
        }
      }, 0 );
      
    });
  }
};

export default API;
