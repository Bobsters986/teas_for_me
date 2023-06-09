<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Bobsters986/teas_for_me">
    <img src="https://user-images.githubusercontent.com/116703107/244487916-3a6fa755-9d6c-4c01-baa2-d3291f7ed368.jpeg" height="400px">
  </a>

<br />
  <h1 align="center"> Teas For Me! </h1>
  <h3 align="center"> Mod 4 Take Home Project </h3>
</div>
<br />


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#schema">Teas For Me Schema</a></li>
    <ul>
        <li><a href="#testing">Testing</a></li>
    </ul>
    <li><a href="#endpoint-details">Endpoint Details</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#designed-by">Designed By</a></li>
    <li><a href="#acknowledgements">Acknowlegdements</a></li>
  </ol>
</details>

<br />

## About The Project

This take-home is meant to simulate a task that you might receive during an interview process. The scope is smaller scale and open ended. The goal is to complete the task in 8 hours or less. Since there is a time limit and due to the tasks open ended nature, you should manage your time and plan appropriately. Not only is completing the take-home necessary, but also explaining your process and reasoning behind your decisions are equally important. Use this challenge to practice speaking about your planning and decision making processes around the code you write.

### Goals
- A strong understanding of Rails
- Ability to create restful routes
- Demonstration of well-organized code, following OOP
- Test Driven Development
- Clear documentation
<br />

### Built With

[![Rails]][Rails-url][![PostgreSQL]][PostgreSQL-url][![RSpec]][RSpec-url][![JSONAPI-Serializer]][JSONAPI-Serializer-url][![Shoulda-Matchers]][Shoulda-Matchers-url][![Puma]][Puma-url][![Faker]][Faker-url][![Rubocop]][Rubocop-url][![VSCode]][VSCode-url]


<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Getting Started
<!-- can change this later or add more detail -->
### Prerequisites

* Ruby
  ```sh
  Ruby 3.1.1
  ```

* Rails
  ```sh
  Rails 7.0.4.3
  ```
* [PostgreSQL](https://www.postgresql.org/download/)

<br />

### Installation

_Follow the steps below to install and set up this app._

1. Clone this Repository
   ```sh
   git clone https://github.com/Bobsters986/teas_for_me
   ```
2. In your terminal, run the following commands;
    ```sh
    bundle install
    rails db:{drop,create,migrate,seed}
    ```
3. Run `rails s` in your terminal and visit [https://turing-school-of-software-and-design-student-plan-team-2.postman.co/workspace/My-Workspace~8efd3471-816f-4d33-8477-a0c65b14d900/collection/26181845-6ea8d2b9-a3cb-40f0-bdbd-94deea32c922](https://turing-school-of-software-and-design-student-plan-team-2.postman.co/workspace/My-Workspace~8efd3471-816f-4d33-8477-a0c65b14d900/collection/26181845-6ea8d2b9-a3cb-40f0-bdbd-94deea32c922) to explore the end points for yourself!


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br />

<!-- USAGE EXAMPLES -->
## Schema

<br />

<div align="center">

  ![tea_schema](https://user-images.githubusercontent.com/116703107/244489795-b37d0ac0-c39e-41d5-bddd-1b4c121b7d5d.png)
</div>


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br />

<!-- Testing -->
### Testing

* This project utilizes RSpec testing
* After cloning this repo and following the steps above to install all necessary gems and API keys:
  * Run the entire test suite using the command `bundle exec rspec`

<br />

<!-- JSON Contract -->
## Endpoint Details
* Below are example Requests and Responses for each endpoint

### Create a Subscription for a Customer - Request/Response
#### POST  '/api/v1/customers/:customer_id/subscriptions'
<details>
  <summary>Successful</summary>

  ![Post](https://user-images.githubusercontent.com/116703107/244542910-dce473b8-94af-43d6-877c-6fbc6dd2c29c.png)

</details>

<details>
  <summary>Unsuccessful</summary>

  * Customer Doesn't Exist

  ![post_no_user](https://user-images.githubusercontent.com/116703107/244543074-b5118ce3-3c9b-4f80-9ccd-ac72736ecd3e.png)

  * Tea Doesn't Exist

  ![post_no_tea](https://user-images.githubusercontent.com/116703107/244543186-0c570c20-e83a-4959-847f-c88536603bbd.png)

  * Missing/Invalid Fields

  ![post_invalid_params](https://user-images.githubusercontent.com/116703107/244543290-f2298632-8857-472d-9b85-2e02a4d0a92f.png)

</details>
<br />

### Update or Cancel a Subscription for a Customer - Request/Response
#### PATCH  '/api/v1/customers/:customer_id/subscriptions/:id'
<details>
  <summary>Successful</summary>

![patch_successful](https://user-images.githubusercontent.com/116703107/244585017-0da09e5c-355c-4610-87c0-90ad2b7a1ef5.png)

</details>

<details>
  <summary>Unsuccessful</summary>

  * Customer Doesn't Exist

  ![patch_no_user](https://user-images.githubusercontent.com/116703107/244585089-0a48b1cf-ac08-42ef-858a-54f09f994fed.png)

  * Subscription Doesn't Exist

  ![patch_no_sub](https://user-images.githubusercontent.com/116703107/244585158-895bb801-5193-4a97-b4be-1f4b8bcf9b81.png)

  * Tea Doesn't Exist

  ![patch_no_tea](https://user-images.githubusercontent.com/116703107/244585222-5d44b43b-38af-4b33-a4d8-83f467e48f07.png)

  * Missing/Invalid Fields

  ![patch_invalid_params](https://user-images.githubusercontent.com/116703107/244585281-567d9c3a-506c-4a75-bec8-1448df3c25bb.png)

</details>
<br />

### Get all of a Customer's Subscriptions (Active and Cancelled)- Request/Response
#### GET  '/api/v1/customers/:customer_id/subscriptions'
<details>
  <summary>Successful</summary>

![get_success](https://user-images.githubusercontent.com/116703107/244585359-070a6fd5-2a36-4b12-9e03-f6ef42b9dfd9.png)

</details>

<details>
  <summary>Unsuccessful</summary>

  * Customer Doesn't Exist

  ![get_unsuccessful](https://user-images.githubusercontent.com/116703107/244585391-87e6c512-a1dd-45a0-993f-d36758055d0f.png)

</details>

<br />

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Designed By

<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/Bobsters986"></td>
  </tr>
  <tr>
    <td>Bobby Luly</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/Bobsters986">GitHub</a><br>
      <a href="https://www.linkedin.com/in/bobbyy-luly-217653260/">LinkedIn</a>
    </td>
</table>

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Acknowledgements
* ["The Best README Template" by Github User othneil](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 

[Rails]: https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000?logo=ruby-on-rails&logoColor=white&style=for-the-badge
[Rails-url]: https://rubyonrails.org 

[Ruby]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[Ruby-url]: https://www.ruby-lang.org/en/

[Circle-CI]: https://img.shields.io/circleci/build/github/wise-app-team/wise-app-be/main
[Circle-url]: https://app.circleci.com/

[PostgreSQL]: https://img.shields.io/badge/-PostgreSQL-4169E1?logo=postgresql&logoColor=white&style=for-the-badge
[PostgreSQL-url]: https://www.postgresql.org/

[Puma]: https://img.shields.io/badge/-Puma-FFD43B?logo=puma&logoColor=black&style=for-the-badge
[Puma-url]: https://github.com/puma/puma

[Capybara]: https://img.shields.io/badge/-Capybara-FF7F50?logo=rubygems&logoColor=white&style=for-the-badge
[Capybara-url]: https://github.com/teamcapybara/capybara

[RSpec]: https://img.shields.io/badge/-RSpec-FF7F50?logo=rubygems&logoColor=white&style=for-the-badge
[RSpec-url]: https://github.com/rspec/rspec

[Faker]: https://img.shields.io/badge/-Faker-FF69B4?logo=rubygems&logoColor=white&style=for-the-badge
[Faker-url]: https://github.com/faker-ruby/faker

[Shoulda-Matchers]: https://img.shields.io/badge/-Shoulda%20Matchers-5B5B5B?logo=rubygems&logoColor=white&style=for-the-badge
[Shoulda-Matchers-url]: https://github.com/thoughtbot/shoulda-matchers

[Web-mock]: https://img.shields.io/badge/-WebMock-8B0000?logo=rubygems&logoColor=white&style=for-the-badge
[Web-mock-url]: https://github.com/bblimke/webmock

[GraphQL]: https://img.shields.io/badge/GraphQL-E10098.svg?style=for-the-badge&logo=GraphQL&logoColor=white
[GraphQL-url]: https://github.com/graphql

[Web-mock]: https://img.shields.io/badge/-WebMock-8B0000?logo=rubygems&logoColor=white&style=for-the-badge
[Web-mock-url]: https://github.com/bblimke/webmock

[VCR]: https://img.shields.io/badge/-VCR-2F4F4F?logo=rubygems&logoColor=white&style=for-the-badge
[VCR-url]:  https://github.com/vcr/vcr

[Figaro]: https://img.shields.io/badge/-Figaro-FF4136?logo=rubygems&logoColor=white&style=for-the-badge
[Figaro-url]: https://github.com/laserlemon/figaro

[Faraday]: https://img.shields.io/badge/-Faraday-3E3E3E?logo=ruby&logoColor=white&style=for-the-badge
[Faraday-url]: https://github.com/lostisland/faraday

[Github-Actions]: https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white
[Github-Actions-url]: https://github.com/features/actions

[Rubocop]: https://img.shields.io/badge/RuboCop-000000.svg?style=for-the-badge&logo=RuboCop&logoColor=white
[Rubocop-url]: https://github.com/rubocop/rubocop

[Render]: https://img.shields.io/badge/Render-46E3B7?style=for-the-badge&logo=render&logoColor=white
[Render-url]: https://render.com/

[VSCode]: https://img.shields.io/badge/VSCode-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white
[VSCode-url]: https://code.visualstudio.com/

[JSONAPI-Serializer]: https://img.shields.io/badge/-JSON%20API%20Serializer-1E90FF?logo=json&logoColor=white&style=for-the-badge
[JSONAPI-Serializer-url]: https://github.com/jsonapi-serializer/jsonapi-serializer