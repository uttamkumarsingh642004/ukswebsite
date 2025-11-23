import { Person, WithContext } from "schema-dts";

export const personStructuredData: WithContext<Person> = {
  "@context": "https://schema.org",
  "@type": "Person",
  name: "Alexander Chen",
  jobTitle: "Chief Executive Officer",
  description:
    "Technology CEO, Innovation Leader, and Strategic Advisor with 20+ years of transformative leadership experience",
  url: "https://alexanderchen.com",
  image: "https://alexanderchen.com/images/alexander-chen.jpg",
  sameAs: [
    "https://www.linkedin.com/in/alexanderchen",
    "https://twitter.com/alexanderchen",
    "https://github.com/alexanderchen",
  ],
  alumniOf: [
    {
      "@type": "Organization",
      name: "Stanford University",
    },
  ],
  worksFor: {
    "@type": "Organization",
    name: "Infinity Technologies",
  },
  knowsAbout: [
    "Leadership",
    "Innovation",
    "Artificial Intelligence",
    "SaaS",
    "Venture Capital",
    "Digital Transformation",
    "Strategic Planning",
    "Technology",
  ],
  award: [
    "Forbes 40 Under 40",
    "TechCrunch CEO of the Year",
    "Fast Company Most Innovative Leaders",
  ],
};

export function generateStructuredData() {
  return {
    __html: JSON.stringify(personStructuredData),
  };
}
