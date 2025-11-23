import { Metadata } from "next";
import ContactSection from "@/components/sections/ContactSection";

export const metadata: Metadata = {
  title: "Contact | Alexander Chen",
  description: "Get in touch with Alexander Chen for advisory, speaking engagements, or strategic partnerships.",
};

export default function ContactPage() {
  return (
    <div className="min-h-screen pt-20">
      {/* Hero */}
      <section className="py-20 bg-gradient-to-b from-gray-50 to-white dark:from-luxury-charcoal dark:to-luxury-black">
        <div className="max-w-4xl mx-auto px-6 text-center">
          <h1 className="text-5xl md:text-6xl font-serif font-bold mb-6 text-gray-900 dark:text-white">
            Get in Touch
          </h1>
          <p className="text-xl text-gray-600 dark:text-gray-400 leading-relaxed max-w-3xl mx-auto">
            I&apos;m always interested in connecting with fellow leaders, entrepreneurs,
            and innovators who are building the future.
          </p>
        </div>
      </section>

      {/* Contact Form */}
      <ContactSection />

      {/* FAQ */}
      <section className="py-20 bg-white dark:bg-luxury-black">
        <div className="max-w-4xl mx-auto px-6">
          <h2 className="text-4xl font-serif font-bold mb-12 text-center text-gray-900 dark:text-white">
            Frequently Asked Questions
          </h2>

          <div className="space-y-6">
            {[
              {
                question: "What types of advisory engagements do you accept?",
                answer:
                  "I work with select companies at the intersection of technology and positive impact, typically at Series B+ stage or established enterprises undergoing transformation. I focus on strategic guidance, leadership development, and navigating complex growth challenges.",
              },
              {
                question: "Do you accept speaking invitations?",
                answer:
                  "Yes, I speak at major industry conferences, executive summits, and select private events. Topics include leadership, innovation, AI/technology strategy, and organizational transformation. Please reach out with event details and I'll review your request.",
              },
              {
                question: "Are you open to board positions?",
                answer:
                  "I currently serve on 3-4 boards and am selective about new commitments. I look for companies with strong mission alignment, exceptional teams, and opportunities where I can add unique value. Board positions require significant time investment, so I only take on roles where I can be deeply engaged.",
              },
              {
                question: "How can startups work with you?",
                answer:
                  "For early-stage companies (pre-Series B), I occasionally take on formal or informal advisory roles and make angel investments. I'm most interested in AI/ML, enterprise SaaS, and climate tech ventures with strong technical teams and clear market opportunities.",
              },
              {
                question: "What's your response time?",
                answer:
                  "I aim to respond to all serious inquiries within 3-5 business days. For time-sensitive matters, please indicate urgency in your message. My team helps manage communications to ensure nothing falls through the cracks.",
              },
            ].map((faq, index) => (
              <div
                key={index}
                className="glass rounded-xl p-6 hover:bg-white/20 dark:hover:bg-black/40 transition-all"
              >
                <h3 className="text-xl font-bold mb-3 text-gray-900 dark:text-white">
                  {faq.question}
                </h3>
                <p className="text-gray-600 dark:text-gray-400 leading-relaxed">
                  {faq.answer}
                </p>
              </div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
}
