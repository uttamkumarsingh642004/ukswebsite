import { Metadata } from "next";
import Image from "next/image";

export const metadata: Metadata = {
  title: "About | Alexander Chen",
  description: "Learn more about Alexander Chen's journey, philosophy, and approach to transformative leadership.",
};

export default function AboutPage() {
  return (
    <div className="min-h-screen pt-20">
      {/* Hero */}
      <section className="py-20 bg-gradient-to-b from-gray-50 to-white dark:from-luxury-charcoal dark:to-luxury-black">
        <div className="max-w-4xl mx-auto px-6">
          <h1 className="text-5xl md:text-6xl font-serif font-bold mb-6 text-gray-900 dark:text-white">
            About Me
          </h1>
          <p className="text-xl text-gray-600 dark:text-gray-400 leading-relaxed">
            A journey from curious engineer to transformative CEO, driven by the belief
            that technology should amplify human potential, not replace it.
          </p>
        </div>
      </section>

      {/* Main Content */}
      <section className="py-16 bg-white dark:bg-luxury-black">
        <div className="max-w-4xl mx-auto px-6">
          <div className="prose prose-lg dark:prose-invert max-w-none">
            <h2 className="text-3xl font-serif font-bold mb-6 text-gray-900 dark:text-white">
              The Journey
            </h2>

            <p className="text-gray-700 dark:text-gray-300 leading-relaxed mb-6">
              My path to leadership wasn&apos;t a straight line. It started in a small garage
              in the early 2000s, where a group of idealistic engineers believed we could
              change the world with code. That startup became a billion-dollar enterprise,
              and I learned my first crucial lesson: great technology without great
              leadership is just potential energy waiting to be released.
            </p>

            <p className="text-gray-700 dark:text-gray-300 leading-relaxed mb-6">
              Over the next two decades, I&apos;ve had the privilege of leading companies
              through every stage of growth—from pre-seed startups to Fortune 500
              enterprises. I&apos;ve navigated three major technology paradigm shifts,
              weathered two economic recessions, and learned that the fundamentals of
              great leadership remain constant even as everything else changes.
            </p>

            <h2 className="text-3xl font-serif font-bold mb-6 mt-12 text-gray-900 dark:text-white">
              Philosophy
            </h2>

            <p className="text-gray-700 dark:text-gray-300 leading-relaxed mb-6">
              I believe in three core principles that have guided every decision I&apos;ve made:
            </p>

            <ul className="space-y-4 mb-6">
              <li className="text-gray-700 dark:text-gray-300">
                <strong className="text-luxury-gold">Vision Before Strategy:</strong> The
                best strategies emerge from compelling visions. Don&apos;t let tactics
                constrain your thinking about what&apos;s possible.
              </li>
              <li className="text-gray-700 dark:text-gray-300">
                <strong className="text-luxury-gold">People Are Everything:</strong> Technology
                is built, operated, and used by people. Invest in understanding human
                behavior, and the rest becomes easier.
              </li>
              <li className="text-gray-700 dark:text-gray-300">
                <strong className="text-luxury-gold">Impact Over Output:</strong> Success
                isn&apos;t measured by how much you ship, but by how much positive change you
                create in the world.
              </li>
            </ul>

            <h2 className="text-3xl font-serif font-bold mb-6 mt-12 text-gray-900 dark:text-white">
              Today
            </h2>

            <p className="text-gray-700 dark:text-gray-300 leading-relaxed mb-6">
              Currently, I serve as CEO of Infinity Technologies, where we&apos;re building
              AI systems that augment human decision-making rather than replace it. I also
              advise select startups and serve on the boards of companies at the
              intersection of technology and positive social impact.
            </p>

            <p className="text-gray-700 dark:text-gray-300 leading-relaxed mb-6">
              Outside of my professional work, I&apos;m passionate about mentoring the next
              generation of leaders, exploring the intersection of consciousness and AI,
              and spending time with my family in the mountains.
            </p>
          </div>

          {/* CTA */}
          <div className="mt-12 pt-8 border-t border-gray-200 dark:border-luxury-slate">
            <h3 className="text-2xl font-serif font-bold mb-4 text-gray-900 dark:text-white">
              Let&apos;s Connect
            </h3>
            <p className="text-gray-600 dark:text-gray-400 mb-6">
              Interested in discussing leadership, technology, or potential collaboration?
            </p>
            <a
              href="/contact"
              className="inline-flex items-center magnetic-button px-8 py-4 bg-gradient-to-r from-luxury-gold to-luxury-silver text-luxury-black font-semibold rounded-lg shadow-lg hover:shadow-xl transition-all"
            >
              Get in Touch
              <svg
                className="ml-2 w-5 h-5"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M17 8l4 4m0 0l-4 4m4-4H3"
                />
              </svg>
            </a>
          </div>
        </div>
      </section>
    </div>
  );
}
