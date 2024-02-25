import 'package:flutter/material.dart';

class ResourcePage extends StatelessWidget {

  final List<ResourceItem> resources = [
    ResourceItem(
      title: 'Understanding Human Trafficking: Unveiling the Shadows of Exploitation',
      description: '''
        Introduction:

        Human trafficking, a grave violation of human rights, persists as a global epidemic with far-reaching consequences. Defined as the exploitation of individuals for forced labor or commercial sex through coercion, deception, or force, human trafficking represents a modern-day form of slavery. This article delves into the intricate layers of human trafficking, shedding light on its prevalence, impact, and the ongoing efforts to combat this heinous crime.

        1. Definition and Forms of Human Trafficking:

        Human trafficking encompasses various forms, primarily categorized into sex trafficking and labor trafficking. In sex trafficking, victims are coerced into engaging in commercial sex acts, while labor trafficking involves exploiting individuals for forced labor. Understanding these distinctions is vital for grasping the complexity of the issue.

        2. Global Scope and Statistics:

        The scope of human trafficking extends worldwide, with millions falling victim to this crime annually. Statistics reveal alarming figures, underlining the urgent need for comprehensive strategies to combat trafficking networks and protect vulnerable populations.

        3. Vulnerability Factors:

        Several factors contribute to an individual's vulnerability to human trafficking. Poverty, lack of education, and political instability are among the root causes that traffickers exploit to coerce individuals into situations of exploitation.

        4. Recruitment and Tactics:

        Traffickers employ a myriad of tactics to recruit victims, ranging from false promises of employment to abduction and physical coercion. Understanding these tactics is crucial for identifying potential victims and preventing further victimization.

        5. Victim Profiles:

        Human trafficking knows no bounds when it comes to the profiles of its victims. Men, women, and children from diverse socio-economic backgrounds can fall prey to traffickers, emphasizing the need for a comprehensive approach to victim support and prevention.

        6. Traffickers and Criminal Networks:

        Organized crime plays a significant role in human trafficking, orchestrating elaborate networks that span across borders. Examining the motivations of traffickers provides insight into dismantling these criminal enterprises.

        7. Impact on Victims:

        The impact of human trafficking on victims is profound, encompassing physical, emotional, and psychological consequences. Survivors face myriad challenges during and after escaping trafficking situations, highlighting the critical need for comprehensive support systems.

        8. Legal Framework and International Efforts:

        International laws and conventions form the legal framework for combating human trafficking. Governments, non-governmental organizations (NGOs), and law enforcement agencies collaborate to enforce these measures and bring traffickers to justice.

        9. Prevention and Awareness:

        Preventing human trafficking requires a multi-faceted approach. Initiatives focused on raising public awareness and educating communities about the dangers of trafficking contribute to prevention efforts.

        10. Support and Rehabilitation:

        Supporting survivors is paramount in the fight against human trafficking. Shelters, counseling services, and vocational training programs play a crucial role in helping survivors rebuild their lives.

        11. Technology and Human Trafficking:

        The digital age has introduced new challenges and opportunities in combatting human trafficking. While traffickers exploit technology for their benefit, law enforcement and NGOs leverage it to track and disrupt trafficking networks.

        12. Challenges and Future Considerations:

        Addressing the challenges in combating human trafficking is an ongoing effort. Underreporting, gaps in law enforcement, and evolving tactics by traffickers necessitate continuous adaptation of strategies. Anticipating future trends is crucial for staying ahead in the fight against this pervasive crime.

        Conclusion:

        Understanding human trafficking requires a comprehensive examination of its various facets. As society collectively works towards eradicating this crime, informed awareness, legal measures, and a commitment to support survivors are essential components in the pursuit of a world free from the shadows of exploitation.
        ''',
      imageUrl: 'https://th.bing.com/th/id/OIP.7SgevSaDeWzPZRjijGikOAHaD4?rs=1&pid=ImgDetMain',
    ),
    ResourceItem(
      title: 'Support for Survivors',
      description: 'Explore resources that provide support and assistance for human trafficking survivors.',
      imageUrl: 'https://th.bing.com/th/id/OIP.UyezX-ZhCdpYR-2_fqaZ5QHaE8?rs=1&pid=ImgDetMain',
    ),
    ResourceItem(
      title: 'Legal Rights',
      description: 'Know the legal rights of human trafficking survivors and how to seek justice.',
      imageUrl: 'https://th.bing.com/th/id/OIP.HaRYMmN1pQ0JlnmwOi5BAAAAAA?rs=1&pid=ImgDetMain',
    ),
    ResourceItem(
      title: 'Rehabilitation Programs',
      description: 'Discover rehabilitation programs aimed at helping survivors rebuild their lives.',
      imageUrl: 'https://www.pcom.edu/_resources/images/digest/october-2015/india.JPG',
    ),
    // Add more hardcoded data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resource Center'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResourceDetailPage(resource: resources[index]),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    resources[index].imageUrl,
                    height: 150.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resources[index].title,
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          // Display the full description if it's shorter than 100 characters
                          resources[index].description.length <= 100
                              ? resources[index].description
                              : '${resources[index].description.substring(0, 100)}...',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



class ResourceItem {
  final String title;
  final String description;
  final String imageUrl;

  ResourceItem({required this.title, required this.description, required this.imageUrl});
}

class ResourceDetailPage extends StatelessWidget {
  final ResourceItem resource;

  ResourceDetailPage({required this.resource});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resource.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              resource.imageUrl,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resource.title,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    resource.description,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  // Add more content as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}