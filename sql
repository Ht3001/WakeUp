-- Pega en el SQL Editor de Supabase y ejecuta todo

CREATE TABLE profiles (
  id uuid PRIMARY KEY REFERENCES auth.users(id),
  role text DEFAULT 'user'
);

CREATE TABLE questions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  text text NOT NULL,
  category text,
  is_premium boolean DEFAULT false
);

CREATE TABLE user_questions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users ON DELETE CASCADE,
  question_id uuid REFERENCES questions ON DELETE CASCADE,
  answered_at timestamp with time zone DEFAULT now(),
  UNIQUE(user_id, question_id)
);

CREATE TABLE achievements (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text,
  threshold int
);

CREATE TABLE user_achievements (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users ON DELETE CASCADE,
  achievement_id uuid REFERENCES achievements ON DELETE CASCADE,
  unlocked_at timestamp with time zone DEFAULT now(),
  UNIQUE(user_id, achievement_id)
);