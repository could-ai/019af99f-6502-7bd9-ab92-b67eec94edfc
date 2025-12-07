import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResumePreviewScreen extends StatelessWidget {
  const ResumePreviewScreen({super.key});

  final String latexCode = r'''
\documentclass[a4paper,10pt]{article}
\usepackage[left=0.75in,top=0.6in,right=0.75in,bottom=0.6in]{geometry}
\usepackage{hyperref}
\usepackage{enumitem}
\usepackage{titlesec}

% Formatting sections
\titleformat{\section}{
  \vspace{-4pt}\scshape\raggedright\large
}{}{0em}{}[\color{black}\titlerule \vspace{-5pt}]

\begin{document}

% Header
\begin{center}
    {\Huge \textbf{Your Name}} \\ \vspace{1mm}
    City, State, Zip $\cdot$ (123) 456-7890 $\cdot$ email@example.com \\
    \href{https://linkedin.com/in/yourprofile}{linkedin.com/in/yourprofile} $\cdot$ \href{https://github.com/yourusername}{github.com/yourusername}
\end{center}

% Education
\section{Education}
\textbf{University Name} \hfill City, State \\
\textit{Bachelor of Science in Computer Science} \hfill Month Year \\
GPA: 3.8/4.0

% Experience
\section{Experience}
\textbf{Company Name} \hfill City, State \\
\textit{Job Title} \hfill Month Year -- Present
\begin{itemize}[noitemsep,topsep=0pt]
    \item Developed and maintained Flutter applications, improving user engagement by 20\%.
    \item Collaborated with cross-functional teams to define, design, and ship new features.
    \item Optimized application performance, reducing load times by 30\%.
\end{itemize}

\textbf{Another Company} \hfill City, State \\
\textit{Intern} \hfill Month Year -- Month Year
\begin{itemize}[noitemsep,topsep=0pt]
    \item Assisted in the development of web applications using React and Node.js.
    \item Wrote unit tests and documentation to ensure code quality.
\end{itemize}

% Projects
\section{Projects}
\textbf{Project Name} $|$ \textit{Flutter, Dart, Firebase} \hfill \href{https://linktoproject.com}{Link}
\begin{itemize}[noitemsep,topsep=0pt]
    \item Built a cross-platform mobile app for task management.
    \item Implemented real-time data synchronization using Firebase.
\end{itemize}

% Skills
\section{Technical Skills}
\begin{itemize}[noitemsep,topsep=0pt]
    \item \textbf{Languages:} Dart, JavaScript, Python, SQL, C++
    \item \textbf{Frameworks:} Flutter, React, Node.js, Express
    \item \textbf{Tools:} Git, Docker, Firebase, AWS, VS Code
\end{itemize}

\end{document}
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATS Friendly Resume Template'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.copy),
            tooltip: 'Copy LaTeX Code',
            onPressed: () {
              Clipboard.setData(ClipboardData(text: latexCode));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('LaTeX code copied to clipboard!')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Copy this code into Overleaf to generate your resume:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: SingleChildScrollView(
                  child: SelectableText(
                    latexCode,
                    style: const TextStyle(fontFamily: 'Courier', fontSize: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: latexCode));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('LaTeX code copied to clipboard!')),
                  );
                },
                icon: const Icon(Icons.copy),
                label: const Text('Copy Code'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
