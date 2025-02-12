<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AtThisPoint._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    
    <!-- Inline CSS for Styling -->
    <style>
        body {
            background-color: #f0f4f8;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        /* Hero Section */
        .hero {
            height: 90vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .hero img {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0;
            transition: opacity 1s ease-in-out;
        }
        
        .hero img.active {
            opacity: 1;
        }
        
        .hero h1, .hero p {
            z-index: 1; /* Ensure text is above images */
        }

        /* Overview Section */
        .overview {
            padding: 50px;
            background-color: #FFCC00;
            text-align: center;
        }

        /* Section Styling */
        .section {
            padding: 20px;
            border-bottom: 5px solid;
        }
        
        .section:nth-of-type(1) { border-bottom-color: red; }
        .section:nth-of-type(2) { border-bottom-color: yellow; }
        .section:nth-of-type(3) { border-bottom-color: #003366; }
        .section:nth-of-type(4) { border-bottom-color: red; }

        /* Footer */
        .footer {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 20px;
        }

        /* Social Media Links */
        .social-icons {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            gap: 15px; /* Adds space between the icons */
        }

        .social-icons a {
            color: black; /* Ensure icons are white */
            font-size: 20px; /* Increase the size of the icons */
            text-decoration: none; /* Remove underline */
            transition: color 0.3s ease; /* Smooth transition for hover effect */
        }

        .social-icons a:hover {
            color: #f39c12; /* Change color on hover (e.g., orange) */
        }

        /* Map and Contact Section */
        .map-contact {
            display: flex;
            justify-content: space-around;
            padding: 50px;
            background-color: #333;
            color: white;
        }

        .map, .contact-info {
            width: 45%;
        }

        /* Social Media Links */
        .social-icons a {
            margin: 0 10px;
            color: white;
            font-size: 24px;
            text-decoration: none;
        }

    </style>

    <!-- JavaScript for Hero Image Slideshow -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            let currentIndex = 0;
            const images = document.querySelectorAll('.hero img');
            const totalImages = images.length;

            function changeImage() {
                images[currentIndex].classList.remove('active');
                currentIndex = (currentIndex + 1) % totalImages;
                images[currentIndex].classList.add('active');
            }

            images[currentIndex].classList.add('active'); // Show first image
            setInterval(changeImage, 5000); // Change image every 5 seconds
        });
    </script>

    <!-- Hero Section with Images -->
    <div class="hero">
        <img src="photos/Dyna.jpg" alt="Hero Image 1" />
        <img src="photos/spark.jpg" alt="Hero Image 2" />
        <img src="photos/Vehicles.jpg" alt="Hero Image 3" />
        <img src="photos/Field.jpg" alt="Hero Image 4" />
        <img src="photos/Khwezi1.jpg" alt="Hero Image 5" />
        <img src="photos/Khwezi2.jpg" alt="Hero Image 6" />
        <img src="photos/Khwezi3.jpg" alt="Hero Image 7" />
        <img src="photos/Khwezi4.jpg" alt="Hero Image 8" />
        <img src="photos/Khwezi5.jpg" alt="Hero Image 9" />
        <img src="photos/Khwezi6.jpg" alt="Hero Image 10" />
        <img src="photos/Khwezi7.jpg" alt="Hero Image 11" />
        <img src="photos/Khwezi8.jpg" alt="Hero Image 12" />
        <img src="photos/Khwezi8.jpg" alt="Hero Image 13" />
        <img src="photos/poster.jpg" alt="Hero Image 14" />
        <img src="photos/logo.jpg" alt="Hero Image 15" />
        <div>
            <h1>Welcome to Khwezi Driving School</h1>
            <p>Your journey to safe driving starts here!</p>
        </div>
    </div>

    <!-- Overview Section -->
    <div id="overview" class="overview">
        <h2>About Us</h2>
        <p>We provide top-notch driving lessons tailored to your needs. Whether you are a beginner or need to polish your skills, our experienced instructors are here to guide you every step of the way.</p>
    </div>

    <!-- Mission Statement Section -->
    <div class="section">
        <h2>Mission Statement</h2>
        <p>Our mission is to offer comprehensive driving education that prepares students for a lifetime of safe driving. We strive to create a supportive and engaging learning environment for all our students.</p>
    </div>

    <!-- Services Section -->
    <div class="section">
        <h2>Services Offered</h2>
        <ul>
            <li>Code 8 Driving Lessons</li>
            <li>Code 10 Driving Courses</li>
            <li>Car and Truck Hire</li>
            <li>Learners Licence Lessons</li>
        </ul>
    </div>

    <!-- Contact Information Section -->
    <div class="section">
        <h2>Contact Information</h2>
        <p>Email: kumalonesh@gmail.com</p>
        <p>Phone: (+27) 83 544 8544 </p>
    </div>

<!-- Social Media Links -->
    <div class="social-icons">
        <a href="https://web.facebook.com/KhweziDrivingSchool" target="_blank" class="fab fa-facebook"></a>
        <a href="https://x.com/i/flow/login?redirect_after_login=%2FPaceDrivingSch1" target="_blank" class="fab fa-twitter"></a>
        <a href="https://www.instagram.com/tkdrivingschool/" target="_blank" class="fab fa-instagram"></a>
        <a href="https://www.tiktok.com/search?q=driving%20school&t=1732117599025" target="_blank" class="fab fa-tiktok"></a>
        <a href="https://za.linkedin.com/in/mandlenkosi-patrick-kumalo-8b1312102" target="_blank" class="fab fa-linkedin"></a>
    </div>

<!-- Map and Contact Section -->
    <div id="contact" class="map-contact">
        <div class="map">
            <h3>Find Us</h3>
            <iframe src="https://www.google.com/maps/embed?pb=!1m26!1m12!1m3!1d27684.80658230823!2d30.95259039149283!3d-29.846941901480125!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m11!3e6!4m3!3m2!1d-29.8254336!2d30.955929599999997!4m5!1s0x1ef7abb01a8f6245%3A0x7a456928d598a15e!2sKhwezi%20Driving%20School%2C%20UKZN%20Concourse%2C%20Student%20Union%2C%20269%20Mazisi%20Kunene%20Rd%2C%20Glenwood%2C%20Durban%2C%204001!3m2!1d-29.8683415!2d30.980571299999998!5e0!3m2!1sen!2sza!4v1732114031602!5m2!1sen!2sza" width="500" height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
        <div class="contact-info">
            <h3>Contact Us</h3>
            <p>Email: kumalonesh@gmail.com</p>
            <p>Phone: (+27) 83 544 8544</p>
            <p>Address: 4 Bisasar Rd, Clare Hills, Durban, 4091</p>
        </div>
    </div>
    
</asp:Content>

