function startProgress() {
  var buttonContainer = document.getElementById("buttonContainer");
  var loadingContainer = document.getElementById("loadingContainer");
  var outputContainer = document.getElementById("outputContainer");
  var progressBar = document.getElementById("progressBar");
  var width = 0;
  var interval = setInterval(frame, 50); // Increase the width every 50 milliseconds
  var input = document.getElementById("user_input").value;
  if (input === "") {
    alert("Please enter a valid input");
    return;
  }
  // Show the button container
  buttonContainer.style.visibility = "visible";
  // Show the loading container
  loadingContainer.style.display = "block";

  function frame() {
    if (width >= 100) {
      clearInterval(interval);
      // Hide the loading container
      loadingContainer.style.display = "none";
      // Show the output container
      outputContainer.style.display = "block";
      // Display the output file
      displayOutputFile(folderName);
      // Show the download button
      downloadButton.style.display = "block";
      displayOutputFileOnIframe(folderName);
    } else {
      width++;
      progressBar.style.width = width + "%";
      if (width === 100) {
        // Call the function to display the output file on an iframe
        displayOutputFileOnIframe(folderName);
        // Show the download button
        downloadButton.style.display = "block";  
      }
    }
  }
}


function displayOutputFile(folderName) {
  // Replace 'file.pdf' with the path to your file
  // var outputFileUrl = '/home/asghar/Documents/repos/turbo-dialect/frontend/4x4_systolic_array.v';
  // var outputFile = document.getElementById("outputFile");
  
  // outputFile.src = outputFileUrl;
  // alert("File is ready for download");
  fetch(`get_file?folder=${folderName}`)
  .then(response => response.text())
  .then(data => {
    console.log(data);
    var output = document.getElementById("output");
    output.innerHTML = data;
  })
}

function displayOutputFileOnIframe(folderName) {
  var iframe = document.getElementById("outputFile");
  iframe.src = `get_file?folder=${folderName}`;
}
const folderName = '../../verilog/pe.v';

function downloadFile() {
  // var downloadButton = document.getElementById("downloadButton");
  var fileUrl = '/home/asghar/Documents/repos/turbo-dialect/frontend/4x4_systolic_array.v'; // Replace with the correct URL
  
  var link = document.createElement('a');
  link.href = fileUrl;
  link.download = fileUrl.split('/').pop();
  
  document.body.appendChild(link);
  
  link.click(); // Programmatically trigger the download
  document.body.removeChild(link); // Clean up the temporary link element
}

// Function to display the first popup
window.onload = function() {
  var popup1 = document.getElementById('popup1');
  popup1.style.display = 'block';
}

// Function to close the first popup and display the second popup
function closePopup1() {
  var popup1 = document.getElementById('popup1');
  popup1.style.display = 'none';
  var popup2 = document.getElementById('popup2');
  popup2.style.display = 'block';
}

// Function to close the second popup
function closePopup2() {
  var popup2 = document.getElementById('popup2');
  popup2.style.display = 'none';
}